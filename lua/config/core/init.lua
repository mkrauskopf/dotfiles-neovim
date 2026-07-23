require("config.core.globals")
require("config.core.options")
require("config.core.keymaps")

vim.filetype.add({
  pattern = {
    [".*/%.codex/rules/[^/]+%.rules"] = "starlark",
  },
})
