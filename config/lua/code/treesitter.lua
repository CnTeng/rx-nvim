---@type LazyPluginSpec
return {
  "nvim-treesitter/nvim-treesitter",
  event = "VeryLazy",
  opts = {
    install_dir = vim.g.parsers_path,
    highlight_disable = { "c", "cpp" },
  },
  config = function(_, opts)
    require("nvim-treesitter").setup(opts)

    vim.api.nvim_create_autocmd("FileType", {
      group = vim.api.nvim_create_augroup("treesitter", { clear = true }),
      callback = function(args)
        local buf = args.buf
        local ft = args.match
        local lang = vim.treesitter.language.get_lang(ft) or ft

        if vim.tbl_contains(opts.highlight_disable or {}, lang) then
          return
        end

        if not vim.treesitter.language.add(lang) then
          return
        end

        vim.wo.foldmethod = "expr"
        vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"

        vim.treesitter.start(buf)

        vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end,
    })
  end,
}
