return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("nvim-tree").setup({
      view = {
        width = 35,
        relativenumber = true,
      },
    })
    local api = require("nvim-tree.api")

    vim.keymap.set("n", "<leader>ee", "<cmd>NvimTreeFindFile<CR>", { desc = "Toggle Explorer" })
  end,
}
