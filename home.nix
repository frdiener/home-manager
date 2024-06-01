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
    (self: super: {
      unstable = unstablePkgs;
    })
  ];
  nixpkgs.config.allowUnfree = true;
  imports =
  [
    ./programs
    ./config/themeing.nix
  ];
  home = {
    stateVersion = "23.11";
    username = "vr1l";
    homeDirectory = "/home/vr1l";
    packages = with pkgs; [
      unstable.qutebrowser
      vscode-fhs
      unstable.firefox
      unstable.thunderbird
      telegram-desktop
      btop
      zellij
      somafm-cli
      keepassxc
      ledger-live-desktop
      shell-gpt
      nerdfonts # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })
      ripgrep
      xclip
      discord
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
      checkstyle
      fzf
      lazygit
      vifm
      poppler_utils # pdftotext
      unstable.openjdk22
      unstable.eclipses.eclipse-java
      lsd
      unstable.obsidian
      llpp
      zathura

      #hyprland stuff
      dunst
      #? anyrun
      ranger
      libsForQt5.polkit-kde-agent

      ## wallpaper stuff
      hyprpaper
      waypaper
      swww
      swaybg
    ];
  };
  xdg = {
    enable = true;
    configFile = {
      "waybar/rofi-wifi-menu.sh".source = ./config/rofi-wifi-menu.sh;
      "hypr/suspend.sh".source = ./config/suspend.sh;
      "hypr/hyprpaper.conf".source = ./config/hyprpaper.conf;
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

  services.gammastep = {
    enable = true;
    provider = "manual";
    latitude = 52.2;
    longitude = 10.0;
  };

  # systemd.user.services.fusuma = {
  #   Unit = {
  #     Description = "Fusuma Touch Gestures";
  #     PartOf = [ "graphical-session.target" ];
  #   };

  #   Install = {
  #     WantedBy = [ "graphical-session.target" ];
  #   };

  #   Service = {
  #     Type = "simple";
  #     ExecStart = "${pkgs.fusuma}/bin/fusuma";
  #     Restart = "on-failure";
  #     Environment = "DISPLAY=:0";
  #   };
  # };
}
