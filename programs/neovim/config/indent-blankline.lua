require("ibl").setup()
vim.g.indent_blankline_use_treesitter = true
vim.g.indent_blankline_char = "┊"
vim.g.indent_blankline_filetype_exclude = {'help', 'dashboard', 'packer'}
vim.g.indent_blankline_buftype_exclude = {'terminal'}
vim.g.indent_blankline_char_highlight = 'LineNr'
vim.g.indent_blankline_show_trailing_blankline_indent = false
vim.g.indent_blankline_show_first_indent_level = false

