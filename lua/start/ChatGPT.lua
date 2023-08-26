if vim.g.gptsupport then
  local opts = {
    api_key_cmd = "cat ./key",
    api_host_cmd = "cat ./host",
    chat = {
      welcome_message = "hello",
    },
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
  }
end
