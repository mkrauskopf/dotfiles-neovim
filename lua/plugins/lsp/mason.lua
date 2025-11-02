return {
  {
    "mason-org/mason-lspconfig.nvim",

    opts = {
      ensure_installed = {
        "cssls",
        "dockerls",
        "eslint",
        "html",
        "lua_ls",
        "pyright",
        "ts_ls",
      },
    },
    dependencies = {
      {
        "williamboman/mason.nvim",
        opts = {
          ui = {
            icons = {
              package_installed = "✓",
              package_pending = "➜",
              package_uninstalled = "✗",
            },
          },
        },
      },
      "neovim/nvim-lspconfig",
    },
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = {
      ensure_installed = {
        "ruff",
        "stylua",

        -- JS, HTML, CSS, ...
        "eslint_d",
        "prettier",
      },
    },
    dependencies = {
      "williamboman/mason.nvim",
    },
  },
}
