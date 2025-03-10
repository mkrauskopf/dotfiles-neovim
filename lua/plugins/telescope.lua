return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.8",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  },

  config = function()
    require("telescope").setup({
      extensions = {
        fzf = {},
      },
    })

    require("telescope").load_extension("fzf")
    local builtin = require("telescope.builtin")

    vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Find Help" })
    vim.keymap.set("n", "<leader>gr", builtin.live_grep, { desc = "Live Grep" })
    vim.keymap.set("n", "<leader>gc", builtin.grep_string, { desc = "Grep string under the Cursor" })
    vim.keymap.set("n", "<leader>ef", builtin.find_files, { desc = "Edit file" })

    vim.keymap.set("n", "<leader>eh", function()
      builtin.find_files({
        hidden = true,
        file_ignore_patterns = { "^.git/" },
      })
    end, { desc = "Edit file (including hidden)" })

    vim.keymap.set("n", "<leader>en", function()
      builtin.find_files({
        cwd = vim.fn.stdpath("config"),
      })
    end, { desc = "Edit Neovim config file" })

    vim.keymap.set("n", "<leader>eb", function()
      builtin.buffers()
    end, { desc = "Edit buffer" })

    vim.keymap.set("n", "<leader>ec", function()
      builtin.commands()
    end, { desc = "Execute Vim command" })

    vim.keymap.set("n", "<leader>ep", function()
      builtin.find_files({
        cwd = vim.fs.joinpath(vim.fn.stdpath("data"), "lazy"),
      })
    end, { desc = "Edit plugin Neovim file" })

    vim.keymap.set("n", "<leader>df", function()
      builtin.find_files({
        cwd = "$HOME/dev/0-github-my/dotfiles-personal",
        hidden = true,
      })
    end, { desc = "Edit dotfile" })

    vim.keymap.set("n", "<leader>er", builtin.oldfiles, { desc = "Edit recent file" })
  end,
}
