return {
  "obsidian-nvim/obsidian.nvim",
  version = "*", -- use latest release, remove to use latest commit
  ---@module 'obsidian'
  ---@type obsidian.config
  opts = {
    legacy_commands = false, -- this will be removed in 4.0.0
    -- workspaces are machine-specific vault paths; kept out of git, see lua/config/local.lua.example
    workspaces = require("config.local").obsidian_workspaces,
  },
  config = function(_, opts)
    require("obsidian").setup(opts)
    vim.keymap.set("n", "<leader>ot", "<cmd>Obsidian tags<CR>", { desc = "Obsidian: tags" })
    vim.keymap.set("n", "<leader>os", "<cmd>Obsidian search<CR>", { desc = "Obsidian: search" })

    -- markview's preview is off by default (see lua/plugins/markview.lua); turn it on for Obsidian notes.
    vim.api.nvim_create_autocmd("User", {
      pattern = "ObsidianNoteEnter",
      callback = function()
        require("markview").commands.enable(vim.api.nvim_get_current_buf())
      end,
    })
  end,
}
