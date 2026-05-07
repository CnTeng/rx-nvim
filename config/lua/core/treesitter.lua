local highlight_disable = { "c", "cpp" }

vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("treesitter", { clear = true }),
  callback = function(args)
    local buf = args.buf
    local ft = args.match
    local lang = vim.treesitter.language.get_lang(ft) or ft

    if not vim.treesitter.language.add(lang) then
      return
    end

    if not vim.tbl_contains(highlight_disable, lang) then
      vim.treesitter.start(buf)
    end

    vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  end,
})
