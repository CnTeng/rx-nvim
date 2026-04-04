---@module "lz.n"
---@type lz.n.Spec
return {
  "dropbar.nvim",
  event = { "BufReadPre", "BufNewFile", "BufWritePre" },
  after = function()
    require("dropbar").setup({
      bar = {
        enable = function(buf, win)
          buf = vim._resolve_bufnr(buf)
          if
            not vim.api.nvim_buf_is_valid(buf)
            or not vim.api.nvim_win_is_valid(win)
            or vim.fn.win_gettype(win) ~= ""
            or vim.wo[win].winbar ~= ""
            or vim.bo[buf].ft == "help"
          then
            return false
          end

          local stat = vim.uv.fs_stat(vim.api.nvim_buf_get_name(buf))
          if stat and stat.size > 1024 * 1024 then
            return false
          end

          return vim.bo[buf].bt == "terminal"
            or vim.bo[buf].ft == "markdown"
            or select(1, vim.treesitter.get_parser(buf)) ~= nil
            or not vim.tbl_isempty(vim.lsp.get_clients({
              bufnr = buf,
              method = "textDocument/documentSymbol",
            }))
        end,
      },
    })
  end,
}
