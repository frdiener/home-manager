{ pkgs, ... }:
let
  unstablePkgs = import <nixos-unstable> {
    config = { 
      allowUnfree = true; 
    }; 
  };
in { 
  nixpkgs.overlays = [
    (self: super: {
      unstable = unstablePkgs;
    })
  ];
  home.packages = with pkgs; [
      libsForQt5.plasma-applet-virtual-desktop-bar
      unstable.kde-rounded-corners
      lightly-boehs
      # libsForQt5.bismuth
      unstable.libsForQt5.polonium
  ];
}

