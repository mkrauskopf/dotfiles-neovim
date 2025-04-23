return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("nvim-tree").setup({
      sync_root_with_cwd = true,
      view = {
        width = 40,
        relativenumber = true,
      },
    })
  end,

  keys = function()
    return {
      { "<leader>ee", "<cmd>NvimTreeFindFile<CR>", desc = "Show file in Explorer" },
      { "<leader>et", "<cmd>NvimTreeToggle<CR>", desc = "Toggle Explorer" },
    }
  end,
}
