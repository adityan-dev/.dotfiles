{ config, pkgs, ... }:
{
  services.xserver.enable = true;
  services.xserver.displayManager.sddm.enable = true;
  services.xserver.layout = "us";
  
  environment.systemPackages = with pkgs; [
    sddm-themes.corners
    libsForQt5.qt5.qtgraphicaleffects
    libsForQt5.qtstyleplugin-kvantum
    libsForQt5.qt5.qtquickcontrols2
  ];
  services.xserver.displayManager.sddm.theme = "corners";
}
