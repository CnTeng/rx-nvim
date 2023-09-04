local telescope = require "telescope"
local actions = require "telescope.actions"

local opts = {
  defaults = {
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
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = "smart_case",
    },
    undo = {},
  },
}

local keys = {
  -- Buffer
  { "<leader>bs", function() require("telescope.builtin").buffers() end, "Swicth buffer" },
  -- File
  { "<leader>fr", function() require("telescope.builtin").oldfiles() end, "Recent files" },
  { "<leader>ff", function() require("telescope.builtin").find_files() end, "Find files" },
  -- Search
  { "<leader>sb", function() require("telescope.builtin").current_buffer_fuzzy_find() end, "Buffer" },
  { "<leader>sc", function() require("telescope.builtin").commands() end, "Commands" },
  { "<leader>sC", function() require("telescope.builtin").command_history() end, "Command history" },
  { "<leader>sh", function() require("telescope.builtin").help_tags() end, "Help pages" },
  { "<leader>sH", function() require("telescope.builtin").highlights() end, "Highlight groups" },
  { "<leader>sk", function() require("telescope.builtin").keymaps() end, "Key maps" },
  { "<leader>sm", function() require("telescope.builtin").man_pages() end, "Man pages" },
  { "<leader>sn", function() require("telescope").extensions.notify.notify() end, "Notifications" },
  { "<leader>so", function() require("telescope.builtin").vim_options() end, "Options" },
  { "<leader>sr", function() require("telescope.builtin").registers() end, "Registers" },
  { "<leader>su", function() require("telescope.builtin").grep_string() end, "Current word" },
  { "<leader>sU", function() require("telescope").extensions.undo.undo() end, "Undo" },
  { "<leader>sw", function() require("telescope.builtin").live_grep() end, "Word" },
  -- Git
  { "<leader>gt", function() require("telescope.builtin").git_status() end, "Git status" },
  { "<leader>gb", function() require("telescope.builtin").git_branches() end, "Git branches" },
  { "<leader>gc", function() require("telescope.builtin").git_commits() end, "Git commits" },
}

require("utils").lazy {
  name = "telescope",
  lazy = false,
  opts = opts,
  keys = keys,
}

telescope.load_extension "fzf"
telescope.load_extension "undo"
