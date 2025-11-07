return {
  "hrsh7th/cmp-nvim-lsp",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    { "antosha417/nvim-lsp-file-operations", config = true },
    { "folke/lazydev.nvim",                  opts = {} },
  },
  config = function()
    -- import cmp-nvim-lsp plugin
    local cmp_nvim_lsp = require("cmp_nvim_lsp")

    -- used to enable autocompletion (assign to every lsp server config)
    local capabilities = cmp_nvim_lsp.default_capabilities()

    vim.lsp.config("*", {
      capabilities = capabilities,
    })
  end,

  keys = function()
    return {
      { "<leader>fu", vim.lsp.buf.references,  desc = "Show usages" },
      { "<leader>rn", vim.lsp.buf.rename,      desc = "Rename refactoring" },
      { "<leader>ca", vim.lsp.buf.code_action, desc = "Show code actions" },
    }
  end,
}
