{
  alejandra,
  lib,
  stylua,
  lua-language-server,
  nil,
}: {
  basicSettings = {
    # colors
    "colors.enable" = true;

    #diagnostic
    "diagnostic.errorSign" = "";
    "diagnostic.hintSign" = "";
    "diagnostic.infoSign" = "";
    "diagnostic.warningSign" = "";
    "diagnostic.virtualText" = true;

    # links
    "links.highlight" = true;
    "links.tooltip" = true;

    # semanticTokens
    "semanticTokens.enable" = true;

    #suggest
    "suggest.completionItemKindLabels" = {
      text = "󰉿";
      method = "󰆧";
      function = "󰊕";
      constructor = "";
      field = "󰜢";
      variable = "󰀫";
      class = "󰠱";
      interface = "";
      module = "";
      property = "󰜢";
      unit = "󰑭";
      value = "󰎠";
      enum = "";
      keyword = "󰌋";
      snippet = "";
      color = "󰏘";
      file = "󰈙";
      reference = "󰈇";
      folder = "󰉋";
      enumMember = "";
      constant = "󰏿";
      struct = "󰙅";
      event = "";
      operator = "󰆕";
      typeParameter = "";
    };
    "suggest.insertMode" = "insert";
    "suggest.virtualText" = true;
  };

  highlightSettings = {
    "highlight.colorNames.enable" = false;
  };

  explorerSettings = {
    "explorer.icon.enableNerdfont" = true;
    "explorer.icon.source" = "nvim-web-devicons";
  };

  diagnosticSettings = {
    "diagnostic-languageserver.formatters" = {
      stylua = {
        command = "${lib.getExe stylua}";
        args = ["--search-parent-directories" "--stdin-filepath" "%filepath" "--" "-"];
      };
    };
    "diagnostic-languageserver.formatFiletypes" = {
      lua = "stylua";
    };
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
}
