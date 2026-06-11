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
        api.map.on_attach.default(bufnr)
        local opts = { buffer = bufnr, nowait = true }
        vim.keymap.set("n", "<C-Left>", "<cmd>NvimTreeResize -2<CR>", opts)
        vim.keymap.set("n", "<C-Right>", "<cmd>NvimTreeResize +2<CR>", opts)
        vim.keymap.set("n", "gr", function()
          local node = api.tree.get_node_under_cursor()
          if not node then
            return
          end
          local abs_path = node.absolute_path
          local dir = (node.type == "directory") and abs_path or vim.fn.fnamemodify(abs_path, ":h")
          require("martinovo").live_grep_in_dir(dir)
        end, vim.tbl_extend("force", opts, { desc = "Live Grep in directory" }))
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
