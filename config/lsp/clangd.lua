--- @type vim.lsp.Config
return {
  cmd = {
    "clangd",
    "--background-index",
    "--clang-tidy",
    "--completion-style=detailed",
    "--function-arg-placeholders",
    "--header-insertion=iwyu",
  },
  filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
  root_markers = {
    ".clangd",
    ".clang-tidy",
    ".clang-format",
    "compile_commands.json",
    "compile_flags.txt",
    "configure.ac", -- AutoTools
  },
  capabilities = {
    textDocument = {
      completion = {
        editsNearCursor = true,
      },
    },
    offsetEncoding = { "utf-8", "utf-16" },
  },
  on_attach = function(_, bufnr)
    vim.keymap.set("n", "<leader>cs", "<cmd>ClangdSwitchSourceHeader<CR>", {
      noremap = false,
      silent = true,
      buffer = bufnr,
      desc = "Switch between source/header",
    })

    vim.keymap.set("n", "<leader>ct", "<cmd>ClangdAST<CR>", {
      noremap = false,
      silent = true,
      buffer = bufnr,
      desc = "View AST",
    })
  end,
}
