return {
  settings = {
    yaml = {
      format = { enable = true },
      schemaStore = { enable = false, url = "" },
      schemas = require("schemastore").yaml.schemas(),
    },
  },
}
