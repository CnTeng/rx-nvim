{
  callPackage,
  symlinkJoin,
  vimPlugins,
  wrapNeovimUnstable,
  neovim-unwrapped,
  extraConfig ? "",
}:
let
  plugins = callPackage ./plugins.nix { };
  configPath = ../../config;
  inherit (plugins) pluginsPath runtimeDeps extraLuaPackages;

  parsersPath = symlinkJoin {
    name = "treesitter-parsers";
    paths = vimPlugins.nvim-treesitter.withAllGrammars.dependencies;
  };

  queriesPath = "${vimPlugins.nvim-treesitter}/runtime";

  nvim-wrapped = wrapNeovimUnstable neovim-unwrapped {
    plugins = [ vimPlugins.lazy-nvim ];
    inherit extraLuaPackages;
    luaRcContent = ''
      vim.g.config_path = "${configPath}"
      vim.g.plugins_path = "${pluginsPath}"
      vim.g.parsers_path = "${parsersPath}"
      vim.g.queries_path = "${queriesPath}"

      vim.opt.rtp:prepend(vim.g.config_path)

      ${builtins.readFile "${configPath}/init.lua"}

      ${extraConfig}
    '';
  };
in
nvim-wrapped.overrideAttrs (old: {
  runtimeDeps = old.runtimeDeps ++ runtimeDeps;
})
