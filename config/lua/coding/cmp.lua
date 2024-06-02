return {
  "hrsh7th/nvim-cmp",
  event = "VeryLazy",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "onsails/lspkind.nvim",
    {
      "garymjr/nvim-snippets",
      dependencies = { "rafamadriz/friendly-snippets" },
      opts = { friendly_snippets = true },
    },
  },
  opts = function()
    local cmp = require "cmp"

    return {
      formatting = {
        format = require("lspkind").cmp_format {
          maxwidth = 50,
          ellipsis_char = "...",
        },
      },
      mapping = cmp.mapping.preset.insert {
        ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
        ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
        ["<CR>"] = cmp.mapping.confirm { select = true },
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif vim.snippet.active { direction = 1 } then
            vim.snippet.jump(1)
          else
            fallback()
          end
        end),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif vim.snippet.active { direction = 1 } then
            vim.snippet.jump(-1)
          else
            fallback()
          end
        end),
      },
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "snippets" },
        { name = "path" },
      }, {
        { name = "buffer" },
      }),
      experimental = {
        ghost_text = true,
      },
    }
  end,
  config = function(_, opts)
    local cmp = require "cmp"
    cmp.setup(opts)

    cmp.setup.cmdline("/", {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = "buffer" },
      },
    })

    cmp.setup.cmdline("?", {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = "buffer" },
      },
    })

    cmp.setup.cmdline(":", {
      mapping = cmp.mapping.preset.cmdline {},
      sources = cmp.config.sources({
        { name = "path" },
      }, {
        { name = "cmdline" },
        { name = "buffer" },
      }),
    })
  end,
}
