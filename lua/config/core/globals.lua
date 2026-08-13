vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

local function copy_path(modifier, with_line)
  local path = vim.fn.expand("%" .. modifier)
  if with_line then
    path = path .. ":" .. vim.fn.line(".")
  end
  vim.fn.setreg("+", path)
  print("Copied: " .. path)
end

vim.api.nvim_create_user_command("CopyAbsPath", function()
  copy_path(":p")
end, { desc = "Copy the current buffer's absolute path to the OS clipboard" })

vim.api.nvim_create_user_command("CopyRelPath", function()
  copy_path(":.")
end, { desc = "Copy the current buffer's relative path to the OS clipboard" })

vim.api.nvim_create_user_command("CopyAbsPathLine", function()
  copy_path(":p", true)
end, { desc = "Copy the current buffer's absolute path with line number to the OS clipboard" })

vim.api.nvim_create_user_command("CopyRelPathLine", function()
  copy_path(":.", true)
end, { desc = "Copy the current buffer's relative path with line number to the OS clipboard" })

vim.api.nvim_create_user_command("CopyMessages", function()
  vim.fn.setreg("+", vim.fn.execute("messages"))
end, { desc = "Copy :messages output to the OS clipboard" })
