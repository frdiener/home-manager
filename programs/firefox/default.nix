{ config, pkgs, lib,  ... }:
let
  unstable = import <nixos-unstable> {
    config = { allowUnfree = true;
    }; 
  };
in
{
  programs.firefox = {
    enable = true;
    package = unstable.firefox;
  };
}
