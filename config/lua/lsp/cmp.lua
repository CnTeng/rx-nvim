---@type LazyPluginSpec
return {
  "hrsh7th/nvim-cmp",
  event = "VeryLazy",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/cmp-emoji",
    "onsails/lspkind.nvim",
    {
      "garymjr/nvim-snippets",
      dependencies = { "rafamadriz/friendly-snippets" },
      opts = { friendly_snippets = true },
    },
  },
  opts = function()
    local cmp = require("cmp")

    return {
      completion = {
        completeopt = vim.o.completeopt,
      },
      formatting = {
        format = require("lspkind").cmp_format({
          maxwidth = 50,
          ellipsis_char = "...",
        }),
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
        ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
        ["<CR>"] = cmp.mapping(cmp.mapping.confirm(), { "i", "c" }),
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif vim.snippet.active({ direction = 1 }) then
            vim.snippet.jump(1)
          else
            fallback()
          end
        end),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif vim.snippet.active({ direction = 1 }) then
            vim.snippet.jump(-1)
          else
            fallback()
          end
        end),
      }),
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "snippets" },
        { name = "path" },
      }, {
        { name = "buffer" },
        { name = "emoji" },
      }),
    }
  end,
  config = function(_, opts)
    local cmp = require("cmp")
    cmp.setup(opts)

    cmp.setup.cmdline({ "/", "?" }, {
      completion = {
        completeopt = "menu,menuone,noselect",
      },
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = "buffer" },
      },
    })

    cmp.setup.cmdline(":", {
      completion = {
        completeopt = "menu,menuone,noselect",
      },
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = "path" },
        { name = "cmdline" },
      }, {
        { name = "buffer" },
      }),
    })
  end,
}
