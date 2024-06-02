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

  treesitterPath = symlinkJoin {
    name = "treesitter-parsers";
    paths = vimPlugins.nvim-treesitter.withAllGrammars.dependencies;
  };

  neovimConfig = neovimUtils.makeNeovimConfig {
    withNodeJs = true;
    plugins = [ vimPlugins.lazy-nvim ];
    inherit extraLuaPackages;
    luaRcContent = ''
      vim.g.config_path = "${../config}"
      vim.g.plugins_path = "${pluginsPath}"
      vim.g.treesitter_path = "${treesitterPath}"

      vim.opt.rtp:prepend(vim.g.config_path)

      ${builtins.readFile ../config/init.lua}

      ${extraConfig}
    '';
  };
in
wrapNeovimUnstable neovim-unwrapped neovimConfig
