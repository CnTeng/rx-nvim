return {
  "echasnovski/mini.nvim",
  keys = {
    {
      mode = "x",
      ">",
      function()
        require("mini.move").move_selection("right")
      end,
      desc = "Move text right",
    },
    {
      mode = "x",
      "<",
      function()
        require("mini.move").move_selection("left")
      end,
      desc = "Move text left",
    },
    {
      mode = "x",
      "<S-j>",
      function()
        require("mini.move").move_selection("down")
      end,
      desc = "Move text down",
    },
    {
      mode = "x",
      "<S-k>",
      function()
        require("mini.move").move_selection("up")
      end,
      desc = "Move text up",
    },
  },
}
