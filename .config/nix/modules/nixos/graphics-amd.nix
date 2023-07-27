{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    vulkan-loader
    amdvlk
    mesa
 ];

}
