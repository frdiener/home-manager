{ pkgs, ... }: 
{
  programs.waybar = {
    enable = true;
  };
  home.packages = with pkgs; [
    font-awesome
    rofi
    iw
  ];  
  programs.waybar.package = pkgs.waybar.overrideAttrs (oa: {
    mesonFlags = (oa.mesonFlags or [ ]) ++ [ "-Dexperimental=true" ];
  });
}
