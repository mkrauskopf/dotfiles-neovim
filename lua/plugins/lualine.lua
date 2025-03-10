return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  lazy = false,

  config = function()
    return require("lualine").setup({})
  end
}
