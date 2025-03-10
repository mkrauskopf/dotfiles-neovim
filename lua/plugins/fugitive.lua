return {
  "tpope/vim-fugitive",

  config = function()
    vim.keymap.set("n", "<leader>ga", ":Git blame<CR>", { desc = "Git blame" })
  end,
}
