---@module "lz.n"
---@type lz.n.Spec
return {
  "vim-illuminate",
  event = { "BufReadPre", "BufNewFile", "BufWritePre" },
  keys = {
    {
      "]]",
      function()
        require("illuminate").goto_next_reference(false)
      end,
      desc = "Next reference",
    },
    {
      "[[",
      function()
        require("illuminate").goto_prev_reference(false)
      end,
      desc = "Previous reference",
    },
  },
  after = function()
    require("illuminate").configure({
      filetype_overrides = { "neo-tree" },
      large_file_cutoff = 2000,
      large_file_overrides = {
        providers = { "lsp" },
      },
    })
  end,
}
