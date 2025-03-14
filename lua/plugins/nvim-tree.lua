return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("nvim-tree").setup({
      view = {
        width = 40,
        relativenumber = true,
      },
    })

    vim.keymap.set("n", "<leader>ee", "<cmd>NvimTreeFindFile<CR>", { desc = "Toggle Explorer" })
  end,
}
