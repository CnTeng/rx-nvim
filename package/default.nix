{
  lib,
  stdenv,
  wrapNeovim,
  neovim-unwrapped,
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
  nodePackages,
  clang-tools,
}: let
  inherit (import ./lib.nix lib vimPlugins) getPluginName getPluginPkg mkInitFile;

  startPlugins = getPluginName ../lua/start;
  optPlugins = getPluginName ../lua/opt;

  configDir = stdenv.mkDerivation {
    name = "nvim-config";
    src = ../lua;
    installPhase = ''
      mkdir -p $out/lua
      mv ./* $out/lua
    '';
  };

  initFile = writeTextFile {
    name = "init.lua";
    text =
      ''
        vim.opt.rtp:append("${configDir}")
        require "core"
      ''
      + mkInitFile "start" startPlugins
      + mkInitFile "opt" optPlugins;
  };

  extraPackages = [
    nodePackages.diagnostic-languageserver
    lua-language-server
    ripgrep
    fd
    # Lua
    lua-language-server # LSP
    stylua # Formatter

    # C & C++
    clang-tools # LSP & Formatter

    # Nix
    nil # LSP
    alejandra
  ];
in
  wrapNeovim neovim-unwrapped {
    configure = {
      customRC = "luafile ${initFile}";
      packages.all.opt = getPluginPkg optPlugins ++ [];
      packages.all.start =
        getPluginPkg startPlugins
        ++ (with vimPlugins; [
          (nvim-treesitter.withPlugins (
            plugins:
              with plugins; [
                nix
                lua
              ]
          ))
          nvim-web-devicons
          friendly-snippets
          plenary-nvim
          telescope-undo-nvim
          telescope-fzf-native-nvim
          neodev-nvim

          cmp-nvim-lsp
          cmp_luasnip
          cmp-buffer
          cmp-path
          cmp-cmdline
          lspkind-nvim
        ]);
    };
    extraMakeWrapperArgs = ''--suffix PATH : "${lib.makeBinPath extraPackages}"'';
  }
