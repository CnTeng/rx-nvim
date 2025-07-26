--- @type vim.lsp.Config
return {
  filetypes = {
    "opentofu",
    "opentofu-vars",
    "terraform",
    "terraform-vars",
  },
  get_language_id = function(_, filetype)
    if filetype == "terraform" then
      return "opentofu"
    end
    if filetype == "terraform-vars" then
      return "opentofu-vars"
    end
    return filetype
  end,
}
