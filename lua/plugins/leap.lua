return {
  "https://codeberg.org/andyg/leap.nvim",

  config = function()
    require("leap").setup({})
    vim.keymap.set({ "n", "x", "o" }, "s", "<Plug>(leap)", { desc = "Leap" })
  end,
}
