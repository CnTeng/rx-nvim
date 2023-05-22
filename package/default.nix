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
  black ? pythonSupport,
  gCalendar ? false,
  gCalendarCred ? null,
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

  calFile = writeTextFile {
    name = "init.lua";
    text =
      ''
        vim.g.calendar_google_calendar = 1
        vim.g.calendar_google_task = 1
      ''
      + lib.optionalString (gCalendarCred != null) ''
        vim.opt.rtp:append("${gCalendarCred}")
        require("${gCalendarCred}")
      '';
  };

  cocSettings = let
    inherit (import ./coc/coc.nix) basicSettings;
    inherit (import ./coc/plugins.nix) highlightSettings;
    inherit
      (import ./coc/lang.nix {inherit lib stylua lua-language-server nil alejandra black;})
      diagnosticSettings
      luaSettings
      nixSettings
      pythonSettings
      ;
  in
    basicSettings
    // highlightSettings
    // diagnosticSettings
    // lib.optionalAttrs nixSupport nixSettings
    // lib.optionalAttrs luaSupport luaSettings
    // lib.optionalAttrs pythonSupport pythonSettings;

  extraPackages = [
    ripgrep
    fd
  ];
in
  wrapNeovim neovim-unwrapped
  {
    configure = {
      customRC =
        ''
          luafile ${initFile}
        ''
        + lib.optionalString gCalendar ''
          luafile ${calFile}
        '';
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
          coc-highlight
          coc-diagnostic
          friendly-snippets
          plenary-nvim
          telescope-undo-nvim
          telescope-ui-select-nvim
          coc-clangd
        ]);
    };
    extraMakeWrapperArgs = ''--suffix PATH : "${lib.makeBinPath extraPackages}"'';
  }
