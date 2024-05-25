{ pkgs, ... }:
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
  programs ={
    starship = {
      enable = true;
      package = unstablePkgs.starship;
    };
  };
}
