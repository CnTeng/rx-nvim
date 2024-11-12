---@type LazyPluginSpec
return {
  "saghen/blink.cmp",
  dependencies = "rafamadriz/friendly-snippets",
  event = "InsertEnter",
  opts = {
    keymap = "enter",
    accept = { auto_brackets = { enabled = true } },
    trigger = { signature_help = { enabled = true } },
    highlight = {
      use_nvim_cmp_as_default = true,
    },
  },
  opts_extend = { "sources.completion.enabled_providers" },
}
