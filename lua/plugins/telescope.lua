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
  end,

  keys = function()
    local builtin = require("telescope.builtin")

    return {
      { "<leader>fh", builtin.help_tags, { desc = "Find Help" } },
      { "<leader>gr", builtin.live_grep, { desc = "Live Grep" } },
      { "<leader>gc", builtin.grep_string, { desc = "Grep string under the Cursor" } },
      { "<leader>ef", builtin.find_files, { desc = "Edit file (telescope)" } },
      { "<leader>eb", builtin.buffers, { desc = "Edit buffer" } },
      { "<leader>ec", builtin.commands, { desc = "Execute Vim command" } },
      { "<leader>er", builtin.oldfiles, { desc = "Edit recent file" } },

      {
        "<leader>eh",
        function()
          builtin.find_files({
            hidden = true,
            file_ignore_patterns = { "^.git/" },
          })
        end,
        { desc = "Edit file (including hidden)" },
      },

      {
        "<leader>en",
        function()
          builtin.find_files({
            cwd = vim.fn.stdpath("config"),
          })
        end,
        { desc = "Edit Neovim config file" },
      },

      {
        "<leader>ep",
        function()
          builtin.find_files({
            cwd = vim.fs.joinpath(vim.fn.stdpath("data"), "lazy"),
          })
        end,
        { desc = "Edit plugin Neovim file" },
      },

      {
        "<leader>df",
        function()
          builtin.find_files({
            cwd = "$HOME/dev/0-github-my/dotfiles-personal",
            hidden = true,
          })
        end,
        { desc = "Edit dotfile" },
      },
    }
  end,
}
