local opts = {
  ast = {
    role_icons = {
      type = "",
      declaration = "",
      expression = "",
      specifier = "",
      statement = "",
      ["template argument"] = "",
    },

    kind_icons = {
      Compound = "",
      Recovery = "",
      TranslationUnit = "",
      PackExpansion = "",
      TemplateTypeParm = "",
      TemplateTemplateParm = "",
      TemplateParamObject = "",
    },
  },
}

require("utils.plugin").lazy {
  pack = "clangd_extensions.nvim",
  name = "clangd_extensions",
  ft = { "*.c", "*.cpp", "*.h", "*.hpp" },
  opts = opts,
}
