return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPre", "BufNewFile" },
  build = ":TSUpdate",
  dependencies = {
    "windwp/nvim-ts-autotag",
  },
  config = function()
    -- Install parsers (ensure_installed is gone; use TSInstall commands or install manually)
    local installed = require("nvim-treesitter").get_installed()
    local wanted = {
      "bash",
      "c",
      "css",
      "dockerfile",
      "gitignore",
      "html",
      "java",
      "javascript",
      "json",
      "lua",
      "markdown",
      "markdown_inline",
      "python",
      "query",
      "tsx",
      "typescript",
      "vim",
      "vimdoc",
      "yaml",
    }
    local to_install = {}
    for _, lang in ipairs(wanted) do
      if not vim.list_contains(installed, lang) then
        table.insert(to_install, lang)
      end
    end
    if #to_install > 0 then
      require("nvim-treesitter").install(to_install)
    end
  end,
}
