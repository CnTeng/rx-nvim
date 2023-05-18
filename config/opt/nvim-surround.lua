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

require("core.utils").lazy_plugin {
  events = "InsertEnter",
  callback = function()
    vim.cmd.packadd "nvim-surround"
    require("core.utils").load_plugin { name = "nvim-surround", opts = opts }
  end,
}
