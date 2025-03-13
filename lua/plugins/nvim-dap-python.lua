return {
  "mfussenegger/nvim-dap-python",

  -- That's where I have my venv. Probably should be more flexible.
  require("dap-python").setup("./.venv/bin/python"),
}
