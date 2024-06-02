return {
  "altermo/ultimate-autopair.nvim",
  event = { "InsertEnter", "CmdlineEnter" },
  opts = {
    tabout = {
      enable = true,
      map = "<Tab>",
      hopout = true,
      do_nothing_if_fail = false,
    },
  },
  -- config = function(_, opts)
  --   local autopair = require "ultimate-autopair"
  --   autopair.init {
  --     autopair.extend_default(opts),
  --     { profile = require("ultimate-autopair.experimental.cmpair").init },
  --   }
  -- end,
}
