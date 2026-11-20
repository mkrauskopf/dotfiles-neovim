-- Helper actions for nvim-tree buffers.
local M = {}

local function api()
  return require("nvim-tree.api")
end

-- Open a diff of exactly two file nodes in a new tab; `hint` is shown when the count is wrong.
local function diff_nodes(nodes, hint)
  if #nodes ~= 2 then
    vim.notify(string.format("%s. Not %d file(s).", hint, #nodes), vim.log.levels.WARN)
    return
  end

  if nodes[1].type == "directory" or nodes[2].type == "directory" then
    vim.notify("Both nodes must be files", vim.log.levels.WARN)
    return
  end

  api().tree.close()
  vim.cmd("tabedit " .. vim.fn.fnameescape(nodes[1].absolute_path))
  vim.cmd("vertical diffsplit " .. vim.fn.fnameescape(nodes[2].absolute_path))
end

-- Return nodes on the visually selected lines and leave visual mode.
-- nvim-tree has no public API for this, so walk the lines with `get_node_under_cursor`.
local function get_selected_nodes()
  local start_line, end_line = vim.fn.line("v"), vim.fn.line(".")
  if start_line > end_line then
    start_line, end_line = end_line, start_line
  end
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "nx", false)

  local cursor = vim.api.nvim_win_get_cursor(0)
  local nodes = {}
  for line = start_line, end_line do
    vim.api.nvim_win_set_cursor(0, { line, 0 })
    local node = api().tree.get_node_under_cursor()
    if node and node.absolute_path then
      table.insert(nodes, node)
    end
  end
  vim.api.nvim_win_set_cursor(0, cursor)
  return nodes
end

-- Diff the two files marked with `m`.
M.diff_marked = function()
  diff_nodes(api().marks.list(), "Mark exactly two files with `m`")
end

-- Diff the two files in the visual selection.
M.diff_selected = function()
  diff_nodes(get_selected_nodes(), "Select exactly two files")
end

-- Live grep in the directory under the cursor (or the parent directory of the file under the cursor).
M.live_grep_in_node_dir = function()
  local node = api().tree.get_node_under_cursor()
  if not node then
    return
  end
  local abs_path = node.absolute_path
  local dir = (node.type == "directory") and abs_path or vim.fn.fnamemodify(abs_path, ":h")
  require("martinovo").live_grep_in_dir(dir)
end

return M
