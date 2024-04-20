{ config, pkgs, lib,  ... }:
let
  unstable = import <nixos-unstable> { inherit config; };
in
{
  programs.firefox = {
    enable = true;
    package = unstable.firefox;
  };
}
