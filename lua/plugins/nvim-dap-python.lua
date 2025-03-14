return {
  "mfussenegger/nvim-dap-python",

  config = function()
    -- That's where I have my venv. Probably should be more flexible.
    require("dap-python").setup("./.venv/bin/python")
  end,
}
