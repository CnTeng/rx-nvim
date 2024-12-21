{
  callPackage,
  symlinkJoin,
  vimPlugins,
  neovimUtils,
  wrapNeovimUnstable,
  neovim-unwrapped,
  extraConfig ? "",
}:
let
  plugins = callPackage ./plugins.nix { };
  configPath = ../../config;
  inherit (plugins) pluginsPath extraLuaPackages;

  parsersPath = symlinkJoin {
    name = "treesitter-parsers";
    paths = vimPlugins.nvim-treesitter.withAllGrammars.dependencies;
  };

  neovimConfig = neovimUtils.makeNeovimConfig {
    autowrapRuntimeDeps = true;
    plugins = [ vimPlugins.lazy-nvim ];
    inherit extraLuaPackages;
    luaRcContent = ''
      vim.g.config_path = "${configPath}"
      vim.g.plugins_path = "${pluginsPath}"
      vim.g.parsers_path = "${parsersPath}"

      vim.opt.rtp:prepend(vim.g.config_path)

      ${builtins.readFile "${configPath}/init.lua"}

      ${extraConfig}
    '';
  };
in
wrapNeovimUnstable neovim-unwrapped neovimConfig
