local telescope = require "telescope"
local actions = require "telescope.actions"

local opts = {
  defaults = {
    prompt_prefix = "   ",
    selection_caret = "  ",
    path_display = { "smart" },

    mappings = {
      i = {
        ["<C-n>"] = actions.cycle_history_next,
        ["<C-p>"] = actions.cycle_history_prev,

        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
      },

      n = {
        ["q"] = actions.close,
      },
    },
  },
  pickers = {
    find_files = {
      theme = "dropdown",
      previewer = false,
      find_command = { "fd", "-H", "-I" }, -- No hidden & ignore
    },
    buffers = {
      theme = "dropdown",
      previewer = false,
    },
  },
  extensions = {
    ["ui-select"] = {
      require("telescope.themes").get_dropdown {},
    },
    undo = {},
  },
}

local keys = {
  -- Buffer
  { "n", "<leader>bs", function() require("telescope.builtin").buffers() end, { desc = "Swicth buffer" } },
  -- File
  { "n", "<leader>fr", function() require("telescope.builtin").oldfiles() end, { desc = "Recent files" } },
  { "n", "<leader>ff", function() require("telescope.builtin").find_files() end, { desc = "Find files" } },
  -- Search
  { "n", "<leader>sb", function() require("telescope.builtin").current_buffer_fuzzy_find() end, { desc = "Buffer" } },
  { "n", "<leader>sc", function() require("telescope.builtin").commands() end, { desc = "Commands" } },
  { "n", "<leader>sC", function() require("telescope.builtin").command_history() end, { desc = "Command history" } },
  { "n", "<leader>sh", function() require("telescope.builtin").help_tags() end, { desc = "Help pages" } },
  { "n", "<leader>sH", function() require("telescope.builtin").highlights() end, { desc = "Highlight groups" } },
  { "n", "<leader>sk", function() require("telescope.builtin").keymaps() end, { desc = "Key maps" } },
  { "n", "<leader>sm", function() require("telescope.builtin").man_pages() end, { desc = "Man pages" } },
  { "n", "<leader>sn", function() require("telescope").extensions.notify.notify() end, { desc = "Notifications" } },
  { "n", "<leader>so", function() require("telescope.builtin").vim_options() end, { desc = "Options" } },
  { "n", "<leader>sr", function() require("telescope.builtin").registers() end, { desc = "Registers" } },
  { "n", "<leader>su", function() require("telescope.builtin").grep_string() end, { desc = "Current word" } },
  { "n", "<leader>sU", function() require("telescope").extensions.undo.undo() end, { desc = "Undo" } },
  { "n", "<leader>sw", function() require("telescope.builtin").live_grep() end, { desc = "Word" } },
  -- Git
  { "n", "<leader>gt", function() require("telescope.builtin").git_status() end, { desc = "Git status" } },
  { "n", "<leader>gb", function() require("telescope.builtin").git_branches() end, { desc = "Git branches" } },
  { "n", "<leader>gc", function() require("telescope.builtin").git_commits() end, { desc = "Git commits" } },
}

require("utils.plugin").load { name = "telescope", opts = opts, keys = keys }

telescope.load_extension "ui-select"
telescope.load_extension "undo"
