{
  lib,
  stdenv,
  wrapNeovim,
  neovim-unwrapped,
  writeText,
  writeTextFile,
  ripgrep,
  fd,
  vimPlugins,
  nixSupport ? true,
  luaSupport ? true,
  pythonSupport ? true,
  nil ? nixSupport,
  alejandra ? nixSupport,
  stylua ? luaSupport,
  lua-language-server ? luaSupport,
  pyright ? pythonSupport,
}: let
  inherit (import ./lib.nix lib) getPlugins mkInitFile;

  startPlugins = getPlugins ../config/start;
  optPlugins = getPlugins ../config/opt;

  cocSettingsFile = writeText "coc-settings.json" (builtins.toJSON cocSettings);

  configDir = stdenv.mkDerivation {
    name = "nvim-config";
    src = ../config;
    installPhase = ''
      mkdir -p $out/lua
      mv ./* $out/lua
      cp ${cocSettingsFile} $out/coc-settings.json
    '';
  };

  initFile = writeTextFile {
    name = "init.lua";
    text =
      ''
        vim.opt.rtp:append("${configDir}")
        vim.g.coc_config_home = "${configDir}"
        require "core"
      ''
      + mkInitFile "start" startPlugins
      + mkInitFile "opt" optPlugins;
  };

  cocSettings = let
    inherit (import ./coc/coc.nix) basicSettings;
    inherit (import ./coc/plugins.nix) highlightSettings explorerSettings;
    inherit
      (import ./coc/lang.nix {inherit lib stylua lua-language-server nil alejandra pyright;})
      diagnosticSettings
      luaSettings
      nixSettings
      ;
  in
    basicSettings
    // highlightSettings
    // explorerSettings
    // diagnosticSettings
    // lib.optionalAttrs nixSupport nixSettings
    // lib.optionalAttrs luaSupport luaSettings;

  extraPackages = [
    ripgrep
    fd
  ];
in
  wrapNeovim neovim-unwrapped
  {
    configure = {
      customRC = "luafile ${initFile}";
      packages.all.opt =
        (map (n: vimPlugins.${n}) optPlugins)
        ++ [];
      packages.all.start =
        (map (n: vimPlugins.${n}) startPlugins)
        ++ (with vimPlugins; [
          nvim-web-devicons
          coc-json
          coc-snippets
          coc-sumneko-lua
          coc-pyright
          coc-explorer
          coc-highlight
          coc-diagnostic
          friendly-snippets
          plenary-nvim
          telescope-undo-nvim
          telescope-ui-select-nvim
        ]);
    };
    extraMakeWrapperArgs = ''--suffix PATH : "${lib.makeBinPath extraPackages}"'';
  }
