
{ config, pkgs, lib,  ... }:
let
  nvimConfig = import ./luaConfig.nix { inherit lib; };
in
{
  programs.neovim = {
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
  };
  xdg = {
    configFile = {
      "checkstyle.xml".source = ../../config/checkstyle.xml;
    };
  };
}
