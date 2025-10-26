return {
  "mason-org/mason.nvim",
  dependencies = {
    "mason-org/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },

  config = function()
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")
    local mason_tool_installer = require("mason-tool-installer")

    mason.setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    mason_lspconfig.setup({
      ensure_installed = {
        "cssls",
        "dockerls",
        "html",
        "lua_ls",
        "pyright",
      },
      automatic_installation = false,
    })

    mason_tool_installer.setup({
      ensure_installed = {
        "ruff",
        "stylua",

        -- JS, HTML, CSS, ...
        "eslint_d",
        "prettier",
      },
    })
  end,
}
