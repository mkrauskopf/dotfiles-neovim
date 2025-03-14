return {
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {},
  config = function()
    vim.keymap.set("n", "<leader>eF", ":FzfLua files<CR>", { desc = "Edit file (FzfLua)" })
  end,
}
