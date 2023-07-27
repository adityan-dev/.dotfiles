{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    gtk-engine-murrine
    gnome.gnome-themes-extra
    gsettings-desktop-schemas
    gnome.dconf-editor
    unstable.catppuccin-gtk
    catppuccin-cursors.mochaPink
  ];
}
