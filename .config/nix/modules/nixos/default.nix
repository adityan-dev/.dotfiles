# Add your reusable NixOS modules to this directory, on their own file (https://nixos.wiki/wiki/Module).
# These should be stuff you would like to share with others, not your personal configurations.

{
  grubEFI = import ./grub-efi.nix;
  sddm = import ./sddm.nix;
  audio = import ./audio.nix;
  networks = import ./networks.nix;
  graphics = {
    amd = import ./graphics-amd.nix;
  };
  bluetooth = import ./bluetooth.nix;
  fonts = import ./fonts.nix;
  plymouth = import ./plymouth.nix;
  misc = import ./misc.nix;
  gtk = import ./gtk.nix;
  emacs = import ./emacs.nix;
  wm = {
    hyprland = import ./hyprland.nix;
  };
  essentials = import ./essentials.nix;
}
