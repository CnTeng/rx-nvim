return {
  "RRethy/vim-illuminate",
  event = "LazyFile",
  keys = {
    { "]]", function() require("illuminate").goto_next_reference(false) end, desc = "Next reference" },
    { "[[", function() require("illuminate").goto_prev_reference(false) end, desc = "Previous reference" },
  },
  opts = {
    filetype_overrides = { "neo-tree" },
    large_file_cutoff = 2000,
    large_file_overrides = {
      providers = { "lsp" },
    },
  },
  config = function(_, opts) require("illuminate").configure(opts) end,
}
