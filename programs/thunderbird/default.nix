{ config, pkgs, lib,  ... }:
let
  unstable = import <nixos-unstable> { };
in
{
  programs.thunderbird = {
    enable = true;
    package = unstable.thunderbird;
    profiles = {
      default = {
        id = "ttbzrrxi.default";
        isDefault = true;
      };
    };
  };
}
