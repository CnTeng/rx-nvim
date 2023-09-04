local opts = function()
  local cmp = require "cmp"
  local luasnip = require "luasnip"

  return {
    formatting = {
      fields = { "abbr", "kind", "menu" },
      format = require("lspkind").cmp_format {
        mode = "symbol_text",
        maxwidth = 30,
        ellipsis_char = "...",

        before = function(entry, vim_item)
          vim_item.menu = ({
            nvim_lsp = "[LSP]",
            luasnip = "[Snippet]",
            orgmode = "[Org]",
            cmdline = "[Cmd]",
            buffer = "[Buffer]",
            path = "[Path]",
          })[entry.source.name]
          return vim_item
        end,
      },
    },
    sorting = {
      -- comparators = {
      --   cmp.config.compare.offset,
      --   cmp.config.compare.exact,
      --   cmp.config.compare.recently_used,
      --   require "clangd_extensions.cmp_scores",
      --   cmp.config.compare.kind,
      --   cmp.config.compare.sort_text,
      --   cmp.config.compare.length,
      --   cmp.config.compare.order,
      -- },
    },
    snippet = {
      expand = function(args) luasnip.lsp_expand(args.body) end,
    },
    mapping = {
      ["<C-k>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),
      ["<C-j>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "c" }),
      ["<C-u>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
      ["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
      ["<C-a>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
      ["<C-e>"] = cmp.mapping {
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      },
      -- Accept currently selected item. If none selected, `select` first item.
      -- Set `select` to `false` to only confirm explicitly selected items.
      ["<CR>"] = cmp.mapping.confirm { select = true },
      ["<Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        elseif luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        else
          fallback()
        end
      end, { "i", "s" }),
      ["<S-Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif luasnip.jumpable(-1) then
          luasnip.jump(-1)
        else
          fallback()
        end
      end, { "i", "s" }),
    },
    sources = {
      { name = "nvim_lsp" },
      { name = "luasnip" },
      { name = "buffer" },
      { name = "path" },
    },
    experimental = {
      ghost_text = true,
    },
  }
end

local config = function()
  local cmp = require "cmp"
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
    sources = {
      { name = "cmdline" },
      { name = "buffer" },
      { name = "path" },
    },
  })
end

require("utils.plugin").lazy {
  name = "cmp",
  lazy = false,
  -- event = "InsertEnter",
  opts = opts,
  config = config,
}
