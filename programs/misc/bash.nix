{ pkgs, ... }:
{
  programs ={
    bash = {
      enable = true;
      shellAliases = {
        l = "lsd -l";
        ll = "lsd -la";
        ls = "lsd";
        sudo = "sudo ";
        conf = "sudo -e /etc/nixos/configuration.nix";
        hconf = "pushd ~/.config/home-manager/; nvim home.nix; popd";
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
  };
}
