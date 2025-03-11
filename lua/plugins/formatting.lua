return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },

  keys = {
    { "<leader>tf", ":FormatToggle!<cr>", desc = "Toggle autoformat for current buffer" },
    { "<leader>tF", ":FormatToggle<cr>", desc = "Toggle autoformat globally" },
  },

  config = function()
    local conform = require("conform")
    local notify = require("notify")

    conform.setup({
      formatters_by_ft = {
        lua = { "stylua" },
        python = { "ruff_organize_imports", "ruff_format" },

        -- JS, HTML, CSS, ...
        javascript = { "prettier" },
        typescript = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
        svelte = { "prettier" },
        css = { "prettier" },
        html = { "prettier" },
        json = { "prettier" },
        yaml = { "prettier" },
        markdown = { "prettier" },
        graphql = { "prettier" },
        liquid = { "prettier" },
      },

      format_on_save = function(bufnr)
        -- Disable with a global or buffer-local variable
        if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
          return
        end
        return {
          lsp_fallback = true,
          timeout_ms = 500,
        }
      end,
    })

    local function show_notification(message)
      notify(message, "info", { title = "conform.nvim" })
    end

    vim.api.nvim_create_user_command("FormatToggle", function(args)
      local is_global = not args.bang
      if is_global then
        vim.g.disable_autoformat = not vim.g.disable_autoformat
        if vim.g.disable_autoformat then
          show_notification("Autoformat-on-save disabled globally")
        else
          show_notification("Autoformat-on-save enabled globally")
        end
      else
        vim.b.disable_autoformat = not vim.b.disable_autoformat
        if vim.b.disable_autoformat then
          show_notification("Autoformat-on-save disabled for this buffer")
        else
          show_notification("Autoformat-on-save enabled for this buffer")
        end
      end
    end, {
      desc = "Toggle autoformat-on-save",
      bang = true,
    })

    vim.keymap.set({ "n", "v" }, "<leader>fo", function()
      conform.format({
        lsp_fallback = true,
        timeout_ms = 500,
      })
    end, { desc = "Format file or range (in visual mode)" })
  end,
}
