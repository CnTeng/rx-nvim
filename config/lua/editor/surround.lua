return {
  "kylechui/nvim-surround",
  event = "LazyFile",
  opts = {
    keymaps = {
      insert = "<C-g>s",
      insert_line = "<C-g>S",
      normal = "gs",
      normal_cur = "gss",
      normal_line = "gS",
      normal_cur_line = "gSS",
      visual = "gs",
      visual_line = "gS",
      delete = "gsd",
      change = "gsc",
      change_line = "gSc",
    },
  },
}
