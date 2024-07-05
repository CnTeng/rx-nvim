{
  wrapNeovimUnstable,
  neovim-unwrapped,
  neovimUtils,
  vimPlugins,
  extraConfig ? "",
  symlinkJoin,
  callPackage,
}:
let
  plugins = callPackage ./plugins.nix { };
  inherit (plugins) pluginsPath extraLuaPackages;

  mkTreesitterPath =
    path: removePath:
    symlinkJoin {
      name = "treesitter-${path}";
      paths = vimPlugins.nvim-treesitter.withAllGrammars.dependencies;
      postBuild = "rm -r $out/${removePath}";
    };

  parsersPath = mkTreesitterPath "parsers" "queries";
  queriesPath = mkTreesitterPath "queries" "parser";

  neovimConfig = neovimUtils.makeNeovimConfig {
    withNodeJs = true;
    plugins = [ vimPlugins.lazy-nvim ];
    inherit extraLuaPackages;
    luaRcContent = ''
      vim.g.config_path = "${../config}"
      vim.g.plugins_path = "${pluginsPath}"
      vim.g.parsers_path = "${parsersPath}"
      vim.g.queries_path = "${queriesPath}"

      vim.opt.rtp:prepend(vim.g.config_path)

      ${builtins.readFile ../config/init.lua}

      ${extraConfig}
    '';
  };
in
wrapNeovimUnstable neovim-unwrapped neovimConfig
