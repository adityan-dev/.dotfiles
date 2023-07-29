
{ config, pkgs, ... }:
{
  services.printing.enable = true;
  services.xserver.libinput.enable = true;
  services.dbus.enable = true;
  programs.light.enable = true;
  services.gvfs.enable = true;
  environment.pathsToLink = [ "/share/zsh" ];
  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;
  hardware.opentabletdriver.enable = true;
}
