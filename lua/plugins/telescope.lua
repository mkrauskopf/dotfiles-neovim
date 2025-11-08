local martinovo = require("martinovo")

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
      { "<leader>fh", builtin.help_tags,   desc = "Find Help" },
      { "<leader>gR", builtin.live_grep,   desc = "Live Grep" },
      { "<leader>gc", builtin.grep_string, desc = "Grep string under the Cursor" },
      { "<leader>eb", builtin.buffers,     desc = "Edit buffer" },
      { "<leader>ec", builtin.commands,    desc = "Execute Vim command" },
      { "<leader>eR", builtin.oldfiles,    desc = "Edit recent files" },
      { "<leader>gs", builtin.git_status,  desc = "Git status" },

      {
        "<leader>ef",
        function()
          builtin.find_files({
            hidden = true,
            file_ignore_patterns = { "^.git/" },
          })
        end,
        desc = "Edit file",
      },
      {
        "<leader>er",
        function()
          builtin.oldfiles({ only_cwd = true })
        end,
        desc = "Edit recent files in the CWD",
      },
      {
        "<leader>fh",
        function()
          builtin.help_tags({ default_text = martinovo.get_visual_selection() })
        end,
        mode = { "v" },
        desc = "Find Help (selection)",
      },
      {
        "<leader>gr",
        function()
          builtin.live_grep({
            default_text = martinovo.get_visual_selection(),
            file_ignore_patterns = { "^.git/" },
            additional_args = function(_)
              return { "--hidden" }
            end,
          })
        end,
        mode = { "v" },
        desc = "Live Grep (selection)",
      },
      {
        "<leader>eh",
        function()
          builtin.find_files({
            hidden = true,
            file_ignore_patterns = { "^.git/" },
          })
        end,
        desc = "Edit file (including hidden)",
      },
      {
        "<leader>gr",
        function()
          builtin.live_grep({
            file_ignore_patterns = { "^.git/" },
            additional_args = function(_)
              return { "--hidden" }
            end,
          })
        end,
        desc = "Live Grep (including hidden)",
      },
      {
        "<leader>en",
        function()
          builtin.find_files({
            cwd = vim.fn.stdpath("config"),
          })
        end,
        desc = "Edit Neovim config file",
      },
      {
        "<leader>ep",
        function()
          builtin.find_files({
            cwd = vim.fs.joinpath(vim.fn.stdpath("data"), "lazy"),
          })
        end,
        desc = "Edit plugin Neovim file",
      },
      {
        "<leader>df",
        function()
          builtin.find_files({
            cwd = "$HOME/dev/0-github-my/dotfiles-personal",
            hidden = true,
          })
        end,
        desc = "Edit dotfile",
      },
    }
  end,
}
