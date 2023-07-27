{ config, pkgs, ... }:

{
  fonts.fontDir.enable = true;
  fonts.fonts = with pkgs; [
    iosevka-comfy.comfy-motion
    material-icons
    material-design-icons
    fira-code
    fira-code-symbols
    ubuntu_font_family
    jetbrains-mono
    roboto-mono
    powerline-fonts
    open-fonts
    emacs-all-the-icons-fonts
  ];
}
