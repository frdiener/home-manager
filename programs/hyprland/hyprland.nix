{ inputs, pkgs, ...}: 
{
  home.packages = with pkgs; [
    # swww
    hyprpicker
    wofi
    libsecret
    brightnessctl
    playerctl
    swaylock-effects
    swayidle
  ];
  
  systemd.user.targets.hyprland-session.Unit.Wants = [ "xdg-desktop-autostart.target" ];
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland = {
      enable = true;
    };
    systemd.enable = true;
  };
}

