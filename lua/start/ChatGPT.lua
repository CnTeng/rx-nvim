if not vim.g.gptsupport then return end

local keys = { { "<leader>C", "<cmd>ChatGPT<cr>", "ChatGPT" } }

local opts = {
  api_key_cmd = "jq -r .key " .. vim.g.gptsecrets,
  api_host_cmd = "jq -r .host " .. vim.g.gptsecrets,
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
require("utils.plugin").load {
  name = "chatgpt",
  opts = opts,
  keys = keys,
}
