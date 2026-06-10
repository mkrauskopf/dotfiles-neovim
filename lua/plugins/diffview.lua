return {
  "sindrets/diffview.nvim",

  cmd = {
    "DiffviewOpen",
    "DiffviewClose",
    "DiffviewFileHistory",
    "DiffviewFocusFiles",
    "DiffviewToggleFiles",
    "DiffviewRefresh",
  },

  keys = {
    { "<leader>gdd", ":DiffviewOpen<CR>", desc = "Git diff: focus current file" },
    { "<leader>gdb", ":DiffviewOpen origin/main..HEAD<CR>", desc = "Git diff: current branch vs origin/main" },
    { "<leader>gdc", ":DiffviewClose<CR>", desc = "Git diff: close" },
    { "<leader>gdl", ":DiffviewLast ", desc = "Git diff: last N commits" },
  },

  init = function()
    vim.api.nvim_create_user_command("DiffviewLast", function(opts)
      local n = tonumber(opts.args) or 1
      vim.cmd(("DiffviewOpen HEAD~%d..HEAD"):format(n))
    end, { nargs = "?", desc = "Diffview of last N commits (default 1)" })
  end,
}
