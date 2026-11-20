return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("nvim-tree").setup({
      on_attach = function(bufnr)
        local api = require("nvim-tree.api")
        local actions = require("martinovo.nvim_tree")
        api.map.on_attach.default(bufnr)

        local map = function(mode, lhs, rhs, desc)
          vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, nowait = true, desc = desc })
        end

        map("n", "<C-Left>", "<cmd>NvimTreeResize -2<CR>", "Shrink Explorer")
        map("n", "<C-Right>", "<cmd>NvimTreeResize +2<CR>", "Widen Explorer")
        map("n", "<leader>df", actions.diff_marked, "Diff marked files")
        map("x", "<leader>df", actions.diff_selected, "Diff selected files")
        map("n", "gr", actions.live_grep_in_node_dir, "Live Grep in directory")
        map("n", "<leader>grd", actions.live_grep_in_node_dir, "Live Grep in directory")
      end,
      sync_root_with_cwd = true,
      view = {
        width = 40,
        relativenumber = true,
      },
      filters = {
        git_ignored = false,
      },
    })
  end,

  keys = function()
    return {
      { "<leader>ee", "<cmd>NvimTreeFindFile<CR>", desc = "Show file in Explorer" },
      {
        "<leader>eE",
        function()
          require("nvim-tree.api").tree.find_file({ focus = false, open = true })
        end,
        desc = "Show file in Explorer (keep focus)",
      },
      { "<leader>et", "<cmd>NvimTreeToggle<CR>", desc = "Toggle Explorer" },
    }
  end,
}
