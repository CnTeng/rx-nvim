return {
  "Bekaboo/dropbar.nvim",
  event = { "BufReadPre", "BufNewFile" },
  keys = {
    {
      "<Leader>D",
      function() require("dropbar.api").pick() end,
      desc = "Dropbar",
    },
  },
}
