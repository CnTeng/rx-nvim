local opts = {
  plugins = { spelling = true },
  key_labels = { ["<leader>"] = "SPC" },
  triggers_blacklist = {
    i = { "j", "k" },
    v = { "j", "k" },
    n = { "L" },
  },
}

require("utils").lazy {
  name = "which-key",
  lazy = false,
  opts = opts,
  init = function()
    vim.opt.timeout = true
    vim.opt.timeoutlen = 300
  end,
  config = function()
    require("which-key").register {
      mode = { "n", "v" },
      ["]"] = { name = "+Next" },
      ["["] = { name = "+Prev" },
      ["g"] = { name = "+Goto" },
      ["gz"] = { name = "+Surround" },
      ["gr"] = { name = "+Go to references" },
      ["<leader>b"] = { name = "+Buffer" },
      ["<leader>f"] = { name = "+File" },
      ["<leader>g"] = { name = "+Git" },
      ["<leader>l"] = { name = "+LSP" },
      ["<leader>s"] = { name = "+Search" },
      ["<leader>t"] = { name = "+Term" },
    }
  end,
}
