return {
  "Bekaboo/dropbar.nvim",
  event = "LazyFile",

  keys = {
    {
      "<Leader>D",
      function()
        require("dropbar.api").pick()
      end,
      desc = "Dropbar",
    },
  },
}
