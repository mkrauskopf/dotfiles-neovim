return {
  "rmagatti/auto-session",
  lazy = false,
  keys = {
    { '<leader>wr', '<cmd>SessionRestore<CR>', desc = 'Session restore' },
    { '<leader>wl', '<cmd>SessionSearch<CR>',  desc = 'Session load' },
    { '<leader>ws', '<cmd>SessionSave<CR>',    desc = 'Save session' },
  },

  config = function()
    local auto_session = require("auto-session")

    auto_session.setup({
      auto_restore_enabled = false,
    })
  end
}
