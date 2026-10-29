vim.opt_local.conceallevel = 2

-- Override Neovim's built-in markdown ftplugin, which sets these to 4
vim.opt_local.tabstop = 2
vim.opt_local.softtabstop = 2
vim.opt_local.shiftwidth = 2

-- Fold heading sections (and code blocks/lists) via treesitter; start with everything open
vim.opt_local.foldmethod = "expr"
vim.opt_local.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt_local.foldlevel = 99
