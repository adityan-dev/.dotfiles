{ config, pkgs, ... }:
{
  programs.dconf.enable = true;
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
    xwayland.hidpi = true;
  };

  environment.systemPackages = with pkgs;
    [
      unstable.hyprland
      unstable.xdg-desktop-portal-hyprland
      hyprpaper
      hyprpicker
    ];

  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-hyprland pkgs.xdg-desktop-portal-gtk ];
  };

}
