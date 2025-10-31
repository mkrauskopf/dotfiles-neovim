local M = {}

M.get_visual_selection = function()
  local mode = vim.fn.mode()
  if mode ~= "v" and mode ~= "V" then
    vim.print("Can be used only in visual mode.\n")
    return ""
  end

  local start_pos = vim.fn.getpos("v")
  local start_line = start_pos[2]
  local start_col = start_pos[3]

  local end_pos = vim.fn.getpos(".")
  local end_line = end_pos[2]
  local end_col = end_pos[3]

  if start_line ~= end_line then
    vim.print("Does not work with multi-line selection.\n")
    return ""
  end

  local line = vim.fn.getline(start_line)
  local text = string.sub(line, start_col, end_col)
  return text
end

return M
