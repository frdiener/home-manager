{ config, pkgs, lib,  ... }:
let
  unstable = import <nixos-unstable> {};
in
{
  programs.firefox = {
    enable = true;
    package = unstable.firefox;
  };
}
