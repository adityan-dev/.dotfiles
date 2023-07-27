{ config, pkgs, ... }:

{
  boot.plymouth.enable = true;
  boot.plymouth.theme="bgrt";

  environment.systemPackages = with pkgs; [
    unstable.plymouth
  ];
}
