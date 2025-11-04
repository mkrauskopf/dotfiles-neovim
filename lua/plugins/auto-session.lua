return {
  "rmagatti/auto-session",
  lazy = false,

  keys = {
    { "<leader>wr", "<cmd>AutoSession restore<CR>", desc = "Session restore" },
    { "<leader>wl", "<cmd>AutoSession search<CR>",  desc = "Session load" },
    { "<leader>ws", "<cmd>AutoSession save<CR>",    desc = "Save session" },
  },

  config = function()
    require("auto-session").setup({
      auto_restore = true,
    })
  end,
}
