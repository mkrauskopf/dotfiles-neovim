-- Open Diffview anchored to the cwd's git tree (not the current buffer's).
local function diffview_open(rest)
  vim.cmd(vim.trim(("DiffviewOpen -C%s %s"):format(vim.fn.fnameescape(vim.fn.getcwd()), rest or "")))
end

-- Show the commit history of the current buffer's file.
local function diffview_file_history()
  vim.cmd(
    vim.trim(
      ("DiffviewFileHistory -C%s %s"):format(
        vim.fn.fnameescape(vim.fn.getcwd()),
        vim.fn.fnameescape(vim.fn.expand("%"))
      )
    )
  )
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
    {
      "<leader>gdh",
      function()
        diffview_file_history()
      end,
      desc = "Git diff: current file history",
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
