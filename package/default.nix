{
  lib,
  wrapNeovimUnstable,
  neovim-unwrapped,
  neovimUtils,
  writeTextFile,
  vimPlugins,
  extraConfig ? "",
  symlinkJoin,
  callPackage,
}:
let
  plugins = callPackage ../plugins { };

  inherit (plugins) pluginsPath binPath;

  treesitterPath = symlinkJoin {
    name = "treesitter-parsers";
    paths = vimPlugins.nvim-treesitter.withAllGrammars.dependencies;
  };

  extraConfigFile = writeTextFile {
    name = "extra.lua";
    text = extraConfig;
  };

  neovimConfig =
    neovimUtils.makeNeovimConfig {
      customRC = ''
        let g:config_path = "${../config}"
        let g:lazy_path = "${vimPlugins.lazy-nvim}"
        let g:plugins_path = "${pluginsPath}"
        let g:treesitter_path = "${treesitterPath}"

        luafile ${../config/init.lua}
        luafile ${extraConfigFile}
      '';
    }
    // {
      wrapperArgs = lib.escapeShellArgs [
        "--suffix"
        "PATH"
        ":"
        binPath
      ];
    };
in
wrapNeovimUnstable neovim-unwrapped neovimConfig
