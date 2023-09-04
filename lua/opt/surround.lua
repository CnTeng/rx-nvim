local opts = {
  keymaps = {
    insert = "<C-g>z",
    insert_line = "<C-g>Z",
    normal = "gz",
    normal_cur = "gzs",
    normal_line = "gZ",
    normal_cur_line = "gZs",
    visual = "gz",
    visual_line = "gZ",
    delete = "gzd",
    change = "gzc",
  },
}

require("utils").lazy {
  event = "InsertEnter",
  pack = "nvim-surround",
  name = "nvim-surround",
  opts = opts,
}
