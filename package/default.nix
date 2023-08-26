{
  lib,
  stdenv,
  wrapNeovim,
  neovim-unwrapped,
  writeTextFile,
  ripgrep,
  fd,
  vimPlugins,
  stylua,
  nil,
  alejandra,
  lua-language-server,
  black,
  clang-tools,
  nodePackages,
  cppSupport ? true,
  cppPkgs ? [clang-tools],
  luaSupport ? true,
  luaPkgs ? [stylua lua-language-server],
  nixSupport ? true,
  nixPkgs ? [nil alejandra],
  pythonSupport ? true,
  pythonPkgs ? [black],
  defaultPackages ? [nodePackages.diagnostic-languageserver ripgrep fd],
  extraPackages ? [],
  gptSupport ? true,
}:
with lib; let
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
      + optionalString luaSupport "vim.g.luasupport = true\n"
      + optionalString cppSupport "vim.g.cppsupport = true\n"
      + optionalString nixSupport "vim.g.nixsupport = true\n"
      + optionalString pythonSupport "vim.g.pythonsupport = true\n"
      + optionalString gptSupport "vim.g.gptsupport = true\n"
      + mkInitFile "start" startPlugins
      + mkInitFile "opt" optPlugins;
  };

  defaultPlugins = with vimPlugins; [
    nvim-web-devicons
    plenary-nvim
  ];

  treesitterPlugins = with vimPlugins; [
    (nvim-treesitter.withPlugins (
      p:
        with p;
          [markdown]
          ++ optionals cppSupport [c cpp]
          ++ optionals luaSupport [lua]
          ++ optionals nixSupport [nix]
          ++ optionals pythonSupport [python]
    ))
    nvim-treesitter-context
    nvim-ts-rainbow2
  ];

  cmpPlugins = with vimPlugins; [
    cmp-nvim-lsp
    cmp_luasnip
    cmp-buffer
    cmp-path
    cmp-cmdline
    lspkind-nvim
  ];

  telescopePlugins = with vimPlugins; [
    telescope-undo-nvim
    telescope-fzf-native-nvim
  ];
in
  wrapNeovim neovim-unwrapped {
    configure = {
      customRC = "luafile ${initFile}";
      packages.all.opt = getPluginPkg optPlugins;
      packages.all.start =
        getPluginPkg startPlugins
        ++ defaultPlugins
        ++ treesitterPlugins
        ++ cmpPlugins
        ++ telescopePlugins;
    };
    extraMakeWrapperArgs = ''--suffix PATH : "${
        makeBinPath
        (defaultPackages
          ++ optionals cppSupport cppPkgs
          ++ optionals luaSupport luaPkgs
          ++ optionals pythonSupport pythonPkgs
          ++ optionals nixSupport nixPkgs
          ++ extraPackages)
      }"'';
  }
