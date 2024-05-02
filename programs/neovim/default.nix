{ config, pkgs, lib,  ... }:
let
  unstablePkgs = import <nixos-unstable> {};
  nvimConfig = import ./nvimConfig.nix { inherit lib; };
in
{
  nixpkgs.overlays = [
    (import (builtins.fetchTarball {
      url = "https://github.com/nix-community/neovim-nightly-overlay/archive/master.tar.gz";
    }))
    (self: super: {
      unstable = unstablePkgs;
    })
  ];
  programs.neovim = {
    enable = true;
    package = pkgs.neovim-nightly;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    extraConfig = ''
      lua << EOF
      ${builtins.unsafeDiscardStringContext nvimConfig}
      vim.o.statuscolumn = "%s %l %r"
      EOF
    '';
    plugins = with pkgs.unstable.vimPlugins; [
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
      {
        plugin = nvim-colorizer-lua;
        config = ''
          lua << END
          require'colorizer'.setup()
          END
        '';
      }
    ];
  };
  xdg = {
    configFile = {
      "checkstyle.xml".source = ../../config/checkstyle.xml;
    };
  };
}
