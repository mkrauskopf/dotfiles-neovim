-- Open Diffview anchored to the cwd's git tree (not the current buffer's).
local function diffview_open(rest)
  vim.cmd(vim.trim(("DiffviewOpen -C%s %s"):format(vim.fn.fnameescape(vim.fn.getcwd()), rest or "")))
end

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
    {
      "<leader>gdd",
      function()
        diffview_open()
      end,
      desc = "Git diff: focus current file",
    },
    {
      "<leader>gdb",
      function()
        diffview_open("origin/master..HEAD")
      end,
      desc = "Git diff: current branch vs origin/master",
    },
    { "<leader>gdc", ":DiffviewClose<CR>", desc = "Git diff: close" },
    { "<leader>gdl", ":DiffviewLast ", desc = "Git diff: last N commits" },
  },

  init = function()
    vim.api.nvim_create_user_command("DiffviewLast", function(opts)
      local n = tonumber(opts.args) or 1
      diffview_open(("HEAD~%d..HEAD"):format(n))
    end, { nargs = "?", desc = "Diffview of last N commits (default 1)" })
  end,
}
