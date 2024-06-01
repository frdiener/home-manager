{ pkgs, ... }:
{
  programs.neovim.plugins = with pkgs.unstable.vimPlugins; [

    alpha-nvim
    toggleterm-nvim
    nvim-autopairs
    auto-session
    plenary-nvim
    vim-tmux-navigator
    lualine-nvim
    nvim-cmp
    nvim-tree-lua
    luasnip
    cmp_luasnip
    lspkind-nvim
    copilot-vim
    # copilot-cmp
    indent-blankline-nvim
    gitsigns-nvim
    telescope-nvim
    telescope-fzf-native-nvim
    cmp-treesitter
    nvim-treesitter.withAllGrammars
    formatter-nvim
    nvim-jdtls
    vim-nix
    nvim-lspconfig
    cmp-nvim-lsp
    ale      
    vim-matchup
    gruvbox-nvim
    cyberdream-nvim
    {
      plugin = nvim-colorizer-lua;
      config = ''
        lua << END
        require'colorizer'.setup()
        END
      '';
    }
  ];
}
