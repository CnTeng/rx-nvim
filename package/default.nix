{
  lib,
  stdenv,
  wrapNeovimUnstable,
  neovim-unwrapped,
  neovimUtils,
  writeTextFile,
  ripgrep,
  jq,
  fd,
  vimPlugins,
  dprint,
  stylua,
  nil,
  alejandra,
  lua-language-server,
  black,
  clang-tools,
  efm-langserver,
  neocmakelsp,
  vscode-extensions,
  gdb,
  cmakeSupport ? true,
  cmakePkgs ? [neocmakelsp],
  cppSupport ? true,
  cppPkgs ? [clang-tools],
  luaSupport ? true,
  luaPkgs ? [stylua lua-language-server],
  nixSupport ? true,
  nixPkgs ? [nil alejandra],
  pythonSupport ? true,
  pythonPkgs ? [black],
  defaultPackages ? [efm-langserver ripgrep fd jq dprint],
  extraPackages ? [],
  gptSupport ? false,
  gptSecrets ? "",
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
        vim.g.pluginsdir = "${configDir}"
        vim.opt.rtp:append("${configDir}")
        require "core"
      ''
      + "vim.g.cpptoolspath = \"${vscode-extensions.ms-vscode.cpptools}/share/vscode/extensions/ms-vscode.cpptools/debugAdapters/bin/OpenDebugAD7\""
      + "vim.g.gdbpath = \"${getExe gdb}\""
      + optionalString luaSupport "vim.g.luasupport = true\n"
      + optionalString cppSupport "vim.g.cppsupport = true\n"
      + optionalString nixSupport "vim.g.nixsupport = true\n"
      + optionalString pythonSupport "vim.g.pythonsupport = true\n"
      + optionalString cmakeSupport "vim.g.cmakesupport = true\n"
      + optionalString gptSupport "vim.g.gptsupport = true\n"
      + optionalString gptSupport "vim.g.gptsecrets = \"${gptSecrets}\"\n"
      + mkInitFile "start" startPlugins
      + mkInitFile "opt" optPlugins;
  };

  defaultPlugins = with vimPlugins; [
    nvim-web-devicons
    plenary-nvim
    fzfWrapper
    efmls-configs-nvim
  ];

  treesitterPlugins = with vimPlugins; [
    nvim-treesitter.withAllGrammars
    nvim-treesitter-context
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

  binPath = makeBinPath (defaultPackages
    ++ optionals cppSupport cppPkgs
    ++ optionals luaSupport luaPkgs
    ++ optionals pythonSupport pythonPkgs
    ++ optionals nixSupport nixPkgs
    ++ optionals cmakeSupport cmakePkgs
    ++ extraPackages);

  neovimConfig =
    neovimUtils.makeNeovimConfig {
      customRC = "luafile ${initFile}";
    }
    // {
      wrapperArgs = escapeShellArgs ["--suffix" "PATH" ":" "${binPath}"];
      packpathDirs.myNeovimPackages = {
        opt = getPluginPkg optPlugins;
        start =
          getPluginPkg startPlugins
          ++ cmpPlugins
          ++ defaultPlugins
          ++ treesitterPlugins
          ++ telescopePlugins;
      };
    };
in
  wrapNeovimUnstable neovim-unwrapped neovimConfig
