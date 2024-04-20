local function SuggestOneLine()
  local suggestion = vim.fn['copilot#Accept']("")
  if suggestion == "" then
    return vim.api.nvim_replace_termcodes("<Tab>", true, true, true)
  else
    local bar = vim.fn['copilot#TextQueuedForInsertion']()
    return bar:match("^[^\n]*")
  end
end

local map = vim.keymap.set
map('i', '<Tab>', SuggestOneLine, {expr = true, remap = false})
vim.api.nvim_set_keymap('i', '<C-l>', 'copilot#Accept("<CR>")', {expr = true, silent = true})
vim.g.copilot_no_tab_map = true
vim.g.copilot_assume_mapped = true
vim.g.copilot_tab_fallback = ""
