local function SuggestOneLine()
  local suggestion = vim.fn['copilot#Accept']("")
  local bar = vim.fn['copilot#TextQueuedForInsertion']()
  -- This captures everything up to a newline
  return bar:match("^[^\n]*")
end
local map = vim.keymap.set
-- Map <Tab> to complete one line in insert mode
map('i', '<Tab>', SuggestOneLine, {expr = true, remap = false})
vim.api.nvim_set_keymap('i', '<C-l>', 'copilot#Accept("<CR>")', {expr = true, silent = true})
vim.g.copilot_no_tab_map = true
vim.g.copilot_assume_mapped = true
vim.g.copilot_tab_fallback = ""
