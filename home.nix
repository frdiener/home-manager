{ config, lib, pkgs, ... }:

let
  unstablePkgs = import <nixos-unstable> {
    config = { 
      allowUnfree = true; 
    }; 
  };
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
  nixpkgs.config.allowUnfree = true;
  imports =
  [
    ./programs/neovim
  ];
  home = {
    stateVersion = "23.11";
    username = "vr1l";
    homeDirectory = "/home/vr1l";
    packages = with pkgs; [
      libsForQt5.bismuth
      libsForQt5.plasma-applet-virtual-desktop-bar
      unstable.kde-rounded-corners
      unstable.qutebrowser
      lightly-boehs
      vscode-fhs
      unstable.firefox
      unstable.thunderbird
      telegram-desktop
      btop
      zellij
      somafm-cli
      keepassxc
      ledger-live-desktop
      shell_gpt
      nerdfonts # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })
      ripgrep
      xclip
      ripcord
      nodejs
      unstable.jdt-language-server
      luajitPackages.lua-lsp
      nodePackages.bash-language-server
      unstable.nil
      yaml-language-server
      fd
      hunspellDicts.en-us
      hunspellDicts.de-de
      lua-language-server
      fzf
      lazygit
      vifm
      poppler_utils # pdftotext
    ];
  };
  xdg = {
    enable = true;
    configFile = {
      "vifm/vifmrc".source = ./config/vifmrc;
      "user-dirs.dirs".text = ''
        XDG_DESKTOP_DIR="$HOME/"
        XDG_DOCUMENTS_DIR="$HOME/"
        XDG_VIDEOS_DIR="$HOME/"
        XDG_DOWNLOAD_DIR="$HOME/downloads"
        XDG_DOWNLOADS_DIR="$HOME/downloads"
        XDG_MUSIC_DIR="$HOME/music"
        XDG_PICTURES_DIR="$HOME/pics"  
        XDG_TEMPLATES_DIR="$HOME/"     
        XDG_PUBLICSHARE_DIR="$HOME/"   
      '';                              
    };
  };
  programs ={
    bash = {
      enable = true;
      shellAliases = {
        ll = "ls -l";
        sudo = "sudo ";
        conf = "sudo -e /etc/nixos/configuration.nix";
        hconf = "nvim ~/.config/home-manager/home.nix";
      };
      # session Variables
      sessionVariables = {
        PATH="$HOME/.local/bin:$PATH:home-manager=/home/vr1l/.nix-defexpr/channels/home-manager"; 
      };
      # custom initialization for bash
      initExtra = '' 
        eval "$(direnv hook bash)"
      '';
    };
    git = {
      enable = true;
      userName = "vr1l";
      userEmail = "51481761+vr1l@users.noreply.github.com";
    };
    starship = {
      enable = true;
      package = unstablePkgs.starship;
    };
  };
  systemd.user.services.fusuma = {
    Unit = {
      Description = "Fusuma Touch Gestures";
      PartOf = [ "graphical-session.target" ];
    };

    Install = {
      WantedBy = [ "graphical-session.target" ];
    };

    Service = {
      Type = "simple";
      ExecStart = "${pkgs.fusuma}/bin/fusuma";
      Restart = "on-failure";
      Environment = "DISPLAY=:0";
    };
  };
}
