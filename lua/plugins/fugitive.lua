return {
  {
    "tpope/vim-fugitive",

    keys = {
      { "<leader>ga", ":Git blame<CR>", desc = "Git blame" },
      { "<leader>gd", ":Gdiffsplit<CR>", desc = "Git diff" },
      { "<leader>go", ":GBrowse<CR>", desc = "Open (remote) file in browse" },
      { "<leader>gs", ":Git<CR>", desc = "Git status" },
    },
  },
  {
    "tpope/vim-rhubarb",
  },
}
