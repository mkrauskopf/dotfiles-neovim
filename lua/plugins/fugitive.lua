return {
  {
    "tpope/vim-fugitive",

    config = function()
      vim.keymap.set("n", "<leader>ga", ":Git blame<CR>", { desc = "Git blame" })
      vim.keymap.set("n", "<leader>gd", ":Gdiffsplit<CR>", { desc = "Git diff" })
      vim.keymap.set("n", "<leader>gs", ":Git<CR>", { desc = "Git status" })
    end,
  },
  {
    "tpope/vim-rhubarb",
  },
}
