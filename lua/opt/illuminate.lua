local opts = {
  large_file_cutoff = 2000,
  large_file_overrides = {
    providers = { "lsp" },
  },
}
local keys = {
  { "]]", function() require("illuminate").goto_next_reference(false) end, "Next reference" },
  { "[[", function() require("illuminate").goto_prev_reference(false) end, "Previous reference" },
}

require("utils.plugin").lazy {
  event = { "BufReadPre", "BufNewFile" },
  name = "illuminate",
  setup = false,
  config = function() require("illuminate").configure(opts) end,
  keys = keys,
}