local opts = {
  large_file_cutoff = 2000,
  large_file_overrides = {
    providers = { "lsp" },
  },
}
local keys = {
  { "n", "]]", function() require("illuminate").goto_next_reference(false) end, { desc = "Next reference" } },
  { "n", "[[", function() require("illuminate").goto_prev_reference(false) end, { desc = "Previous reference" } },
}

require("utils.plugin").load {
  keys = keys,
  config = function() require("illuminate").configure(opts) end,
}
