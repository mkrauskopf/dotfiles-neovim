local function nmap(lhs, rhs, opts)
  vim.keymap.set("n", lhs, rhs, opts)
end

local function imap(lhs, rhs, opts)
  vim.keymap.set("i", lhs, rhs, opts)
end

local function vmap(lhs, rhs, opts)
  vim.keymap.set("v", lhs, rhs, opts)
end

imap("jj", "<Esc>")
nmap("ZC", ":bdelete<CR>")
nmap("<Tab>", "i<SPACE><ESC>")

nmap(
  "<leader>cwd",
  ':cd %:h<CR>:echo "Changed to " . expand("%:p:h")<CR>',
  { desc = "Change working directory to current file" }
)

-- Backspace pasting and yanking
--cmap("<C-BS>", "<C-R>+")
--cmap("<S-BS>", "<C-R>*")
imap("<C-BS>", "<C-R>+")
imap("<S-BS>", "<C-R>*")
imap("<D-v>", "<C-R>*")
nmap("<C-S-BS>", "<C-BS><CR><S-BS>")
imap("<C-S-BS>", "<C-BS><CR><S-BS>")
nmap("<BS>", '"*p')
nmap("<D-v>", '"*p')
nmap("<C-BS>", '"+P')
nmap("<C-S-BS>", "<C-BS><S-CR><S-BS>")
nmap("<S-BS>", '"*P')
vmap("<BS>", '"*y')
vmap("<C-BS>", '"+y')
-- Copy content of the file into '+' buffer
nmap("<C-S-BS>", ":0,$yank +<CR>")

-- window management
nmap("<leader>sv", "<C-w>v", { desc = "Split window vertically" })
nmap("<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
nmap("<leader>se", "<C-w>=", { desc = "Make splits equal size" })
nmap("<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })

-- buffers switching
nmap("<D-p>", ":bprevious<CR>")
nmap("<D-n>", ":bnext<CR>")

-- buffer editing
nmap("<S-CR>", "o<ESC>")
imap("<S-CR>", "<ESC>o")
imap("<C-S-CR>", "<ESC>O")
nmap("<C-S-CR>", "O<ESC>")

-- Move selected visual block up and down
vmap("K", ":m '<-2<CR>gv=gv")
vmap("J", ":m '>+1<CR>gv=gv")

-- Sort and uniq visual block
vmap("<leader>so", ":sort u<CR>", { desc = "Sort unique" })
vmap("<leader>sO", ":sort iu<CR>", { desc = "Sort unique, ignore case" })
nmap("<leader>so", ":%sort u<CR>", { desc = "Sort unique" })
nmap("<leader>sO", ":%sort iu<CR>", { desc = "Sort unique, ignore case" })

-- Run Lua
nmap("<leader><leader>x", "<cmd>source %<CR>", { desc = "Source current file" })
nmap("<leader>x", ":.lua<CR>", { desc = "Source current line" })
vmap("<leader>x", ":lua<CR>", { desc = "Source visual block" })
