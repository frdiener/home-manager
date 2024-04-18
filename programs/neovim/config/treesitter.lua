-- import nvim-treesitter plugin
local treesitter = require("nvim-treesitter.configs")

-- configure treesitter
treesitter.setup({ -- enable syntax highlighting
  highlight = {
    enable = true,
  },
  -- enable indentation
  indent = { enable = true },
  -- enable autotagging (w/ nvim-ts-autotag plugin)
  autotag = {
    enable = true,
  },
  -- ensure these language parsers are installed
  -- ensure_installed = {
  --   "json",
  --   "java",
  --   "python",
  --   "nix",
  --   "yaml",
  --   "html",
  --   "css",
  --   "markdown",
  --   "markdown_inline",
  --   "bash",
  --   "lua",
  --   "vim",
  --   "dockerfile",
  --   "gitignore",
  --   "query",
  --   "vimdoc",
  --   "c",
  -- },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<C-space>",
      node_incremental = "<C-space>",
      scope_incremental = false,
      node_decremental = "<bs>",
    },
  },
})
