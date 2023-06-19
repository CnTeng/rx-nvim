{
  lib,
  nil,
  alejandra,
  stylua,
  lua-language-server,
  black,
}: {
  diagnosticSettings = {
    "diagnostic-languageserver.formatters" = {
      stylua = {
        command = "${lib.getExe stylua}";
        args = [
          "--search-parent-directories"
          "--stdin-filepath"
          "%filepath"
          "--"
          "-"
        ];
      };
    };
    "diagnostic-languageserver.formatFiletypes" = {lua = "stylua";};
  };

  nixSettings = {
    languageserver = {
      nix = {
        command = "${lib.getExe nil}";
        filetypes = ["nix"];
        rootPatterns = ["flake.nix"];
        settings = {
          nil = {
            formatting = {command = ["${lib.getExe alejandra}"];};
            nix = {flake = {autoEvalInputs = false;};};
          };
        };
      };
    };
  };

  luaSettings = {
    "sumneko-lua.enableNvimLuaDev" = true;
    "sumneko-lua.checkUpdate" = false;
    "sumneko-lua.serverDir" = "${lua-language-server}/share/lua-language-server";
    "Lua.codeLens.enable" = true;
    "Lua.completion.callSnippet" = "Replace";
    "Lua.format.enable" = false;
    "Lua.misc.parameters" = [
      "--metapath=~/.cache/sumneko_lua/meta"
      "--logpath=~/.cache/sumneko_lua/log"
    ];
    "Lua.workspace.library" = ["\${3rd}/luv/library"];
  };

  pythonSettings = {
    "python.formatting.provider" = "black";
    "python.formatting.blackPath" = "${lib.getExe black}";
    "python.linting.flake8Enabled" = true;
  };
}
