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

-- window and buffer management
nmap("<C-Left>", "<cmd>vertical resize -2<CR>", { desc = "Window: decrease width" })
nmap("<C-Right>", "<cmd>vertical resize +2<CR>", { desc = "Window: increase width" })
nmap("<C-Up>", "<cmd>resize +2<CR>", { desc = "Window: increase height" })
nmap("<C-Down>", "<cmd>resize -2<CR>", { desc = "Window: decrease height" })
-- make it work also in the terminal window
vim.keymap.set("t", "<C-Left>", "<C-\\><C-n><cmd>vertical resize -2<CR>i", { desc = "Window: decrease width" })
vim.keymap.set("t", "<C-Right>", "<C-\\><C-n><cmd>vertical resize +2<CR>i", { desc = "Window: increase width" })
vim.keymap.set("t", "<C-Up>", "<C-\\><C-n><cmd>resize +2<CR>i", { desc = "Window: increase height" })
vim.keymap.set("t", "<C-Down>", "<C-\\><C-n><cmd>resize -2<CR>i", { desc = "Window: decrease height" })

nmap("<leader>bp", ":bprevious<CR>", { desc = "Buffer: Previous" })
nmap("<leader>bn", ":bnext<CR>", { desc = "Buffer: Next" })
nmap("<leader>cpa", ":CopyAbsPath<CR>", { desc = "Copy the current buffer's absolute path to the OS clipboard" })
nmap("<leader>cpr", ":CopyRelPath<CR>", { desc = "Copy the current buffer's relative path to the OS clipboard" })

nmap("<leader>dd", function()
  if vim.wo.diff then
    vim.cmd("windo diffoff")
  else
    vim.cmd("windo diffthis")
  end
end, { desc = "Diff: toggle for windows in tab" })

-- Toggle quickfix window
nmap("<leader>qf", function()
  for _, win in ipairs(vim.fn.getwininfo()) do
    if win.quickfix == 1 then
      vim.cmd("cclose")
      return
    end
  end
  vim.cmd("copen")
end, { desc = "Quickfix: Toggle" })

-- buffer editing
nmap("<S-CR>", "o<ESC>")
imap("<S-CR>", "<ESC>o")
imap("<C-S-CR>", "<ESC>O")
nmap("<C-S-CR>", "O<ESC>")

-- Move selected visual block up and down
-- Disable for now: I'm using standard Vim `J` functionality a lot.
-- vmap("K", ":m '<-2<CR>gv=gv")
-- vmap("J", ":m '>+1<CR>gv=gv")

-- Sort and uniq visual block
vmap("<leader>so", ":sort u<CR>", { desc = "Sort unique" })
vmap("<leader>sO", ":sort iu<CR>", { desc = "Sort unique, ignore case" })
nmap("<leader>so", ":%sort u<CR>", { desc = "Sort unique" })
nmap("<leader>sO", ":%sort iu<CR>", { desc = "Sort unique, ignore case" })

-- Run Lua
nmap("<leader><leader>x", "<cmd>source %<CR>", { desc = "Source current file" })
nmap("<leader>x", ":.lua<CR>", { desc = "Source current line" })
vmap("<leader>x", ":lua<CR>", { desc = "Source visual block" })

-- Google it
vmap("<leader>gO", require("martinovo").google_visual_selection, { desc = "Search visual selection on Google" })

nmap("<leader>tE", function()
  local dir = vim.fn.expand("%:p:h")
  vim.cmd("botright vsplit")
  vim.cmd("lcd " .. vim.fn.fnameescape(dir))
  vim.cmd("terminal")
  vim.cmd("startinsert")
end, { desc = "Terminal: open in current file's directory" })

nmap("<leader>te", function()
  vim.cmd("botright vsplit")
  vim.cmd("terminal")
  vim.cmd("startinsert")
end, { desc = "Terminal: open in working directory" })

-- Switch back from the terminal naturally.
vim.keymap.set("t", "<C-w><C-p>", "<C-\\><C-n><C-w><C-p>")
vim.keymap.set("t", "<C-w><C-w>", "<C-\\><C-n><C-w><C-w>")
vim.keymap.set("t", "<C-w><C-h>", "<C-\\><C-n><C-w><C-h>")
vim.keymap.set("t", "<C-w><C-j>", "<C-\\><C-n><C-w><C-j>")
vim.keymap.set("t", "<C-w><C-k>", "<C-\\><C-n><C-w><C-k>")
vim.keymap.set("t", "<C-w><C-l>", "<C-\\><C-n><C-w><C-l>")
