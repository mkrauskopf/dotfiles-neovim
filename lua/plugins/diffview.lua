return {
  "sindrets/diffview.nvim",

  keys = {
    { "<leader>gdd", ":DiffviewOpen<CR>", desc = "Git diff: focus current file" },
    { "<leader>gdb", ":DiffviewOpen origin/main..HEAD<CR>", desc = "Git diff: current branch vs origin/main" },
    { "<leader>gdc", ":DiffviewClose<CR>", desc = "Git diff: close" },
  },
}
