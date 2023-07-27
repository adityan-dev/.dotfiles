{ config, pkgs, ... }:

{
  networking.networkmanager.enable = true;
  networking.firewall.enable = false;
  services.openssh.enable = true;

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  environment.systemPackages = with pkgs; [
    networkmanagerapplet
    linux-wifi-hotspot
  ];
}
