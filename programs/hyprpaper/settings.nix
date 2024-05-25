
{ pkgs, ... }: 
{
  services.hyprpaper.settings = {
    ipc = "on";
    splash = false;
    splas_offest = 2.0;

    preload = [
      "/home/vr1l/.local/src/gruvbox-wallpapers/wallpapers/pixelart/dock.jpg"
    ];

    wallpaper = [
      "DP-3, /home/vr1l/.local/src/gruvbox-wallpapers/wallpapers/pixelart/dock.jpg"
      "DP-1, /home/vr1l/.local/src/gruvbox-wallpapers/wallpapers/pixelart/dock.jpg"
    ];
  };
}
