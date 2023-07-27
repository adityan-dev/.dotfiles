{ config, pkgs, ... }:
{
  gtk = {
    enable = true;
    theme = {
      name = "Catppuccin-Mocha-Compact-Pink-Dark";
      package = pkgs.unstable.catppuccin-gtk.override {
        accents = ["pink"];
        size = "compact";
        tweaks = ["rimless" "black"];
        variant = "mocha";
      };
    };
    
    cursorTheme = {
      name = "Catppuccin Mocha Pink";
      package = pkgs.unstable.catppuccin-cursors.mochaPink;
      size = 16;
    };
  };
}
