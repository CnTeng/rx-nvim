if not vim.g.gptsupport then return end

local keys = { { "<leader>C", "<cmd>ChatGPT<cr>", "ChatGPT" } }

local opts = {
  api_key_cmd = "cat " .. vim.g.gptkey,
  api_host_cmd = "cat " .. vim.g.gpthost,
  openai_params = {
    model = "gpt-3.5-turbo",
    frequency_penalty = 0,
    presence_penalty = 0,
    max_tokens = 3000,
    temperature = 0,
    top_p = 1,
    n = 1,
  },
}

require("utils").lazy {
  name = "chatgpt",
  pack = "ChatGPT.nvim",
  opts = opts,
  keys = keys,
}
