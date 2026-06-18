-- Run a Claude command, then focus the Claude terminal once it settles.
local function then_focus(cmd)
  return function()
    vim.cmd(cmd)
    vim.schedule(function()
      vim.cmd("ClaudeCodeFocus")
    end)
  end
end

return {
  "coder/claudecode.nvim",
  dependencies = { "folke/snacks.nvim" },
  config = true,
  keys = {
    { "<leader>a", nil, desc = "AI/Claude Code" },
    { "<leader>ac", "<cmd>ClaudeCode<cr>", desc = "Toggle Claude" },
    { "<leader>af", "<cmd>ClaudeCodeFocus<cr>", desc = "Focus Claude" },
    { "<leader>ar", "<cmd>ClaudeCode --resume<cr>", desc = "Resume Claude" },
    { "<leader>aC", "<cmd>ClaudeCode --continue<cr>", desc = "Continue Claude" },
    { "<leader>am", "<cmd>ClaudeCodeSelectModel<cr>", desc = "Select Claude model" },
    { "<leader>al", then_focus(".ClaudeCodeSend"), desc = "Add current line" },
    { "<leader>as", then_focus(".ClaudeCodeSend"), desc = "Add current line (alias)" },
    { "<leader>ab", then_focus("ClaudeCodeAdd %"), desc = "Add current buffer" },
    { "<leader>as", then_focus("ClaudeCodeSend"), desc = "Send to Claude", mode = "v" },
    {
      "<leader>as",
      "<cmd>ClaudeCodeTreeAdd<cr>",
      desc = "Add file",
      ft = { "NvimTree", "netrw" },
    },
    -- Diff management
    { "<leader>aa", "<cmd>ClaudeCodeDiffAccept<cr>", desc = "Accept diff" },
    { "<leader>ad", "<cmd>ClaudeCodeDiffDeny<cr>", desc = "Deny diff" },
  },
}
