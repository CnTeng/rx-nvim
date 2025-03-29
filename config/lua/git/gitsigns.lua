---@type LazyPluginSpec
return {
  "lewis6991/gitsigns.nvim",
  event = "LazyFile",
  opts = {
    current_line_blame = true,
    preview_config = { border = "none" },
    on_attach = function(bufnr)
      local gitsigns = require("gitsigns")

      local function map(mode, l, r, desc)
        vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
      end

      -- Navigation
      map("n", "]c", function()
        if vim.wo.diff then
          vim.cmd.normal({ "]c", bang = true })
        else
          gitsigns.nav_hunk("next")
        end
      end, "Next hunk")

      map("n", "[c", function()
        if vim.wo.diff then
          vim.cmd.normal({ "[c", bang = true })
        else
          gitsigns.nav_hunk("prev")
        end
      end, "Previous hunk")

      -- Actions
      map("n", "<leader>gs", gitsigns.stage_hunk, "Stage hunk")
      map("n", "<leader>gr", gitsigns.reset_hunk, "Reset hunk")
      map("v", "<leader>gs", function()
        gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
      end, "Stage hunk")
      map("v", "<leader>gr", function()
        gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
      end, "Reset hunk")
      map("n", "<leader>gS", gitsigns.stage_buffer, "Stage buffer")
      map("n", "<leader>gR", gitsigns.reset_buffer, "Reset buffer")
      map("n", "<leader>gk", gitsigns.preview_hunk, "Preview hunk")
      map("n", "<leader>gB", gitsigns.blame, "Blame")
      map("n", "<leader>gd", gitsigns.diffthis, "Diff this")
      map("n", "<leader>gD", function()
        gitsigns.diffthis("~")
      end, "Diff this (cached)")

      -- Text object
      map({ "o", "x" }, "ih", ":<C-u>Gitsigns select_hunk<cr>", "Select hunk")
      map({ "o", "x" }, "ah", ":<C-u>Gitsigns select_hunk<cr>", "Select hunk")
    end,
  },
}
