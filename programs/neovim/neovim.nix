{ config, pkgs, lib,  ... }:
let
  unstablePkgs = import <nixos-unstable> {};
in
{
  nixpkgs.overlays = [
    # (import (builtins.fetchTarball {
    #   url = "https://github.com/nix-community/neovim-nightly-overlay/archive/master.tar.gz";
    # }))
    (self: super: {
      unstable = unstablePkgs;
    })
  ];
  programs.neovim = {
    enable = true;
    package = pkgs.unstable.neovim-unwrapped;
  };
}
