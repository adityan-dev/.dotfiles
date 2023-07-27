{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # Core
    brightnessctl
    neovim
    firefox-wayland
    kitty
    swaynotificationcenter
    zsh
    starship
    git
    wget
    curl
    ripgrep
    busybox

    # UI
    wofi
    waybar 
    wlogout
    neofetch

    # Media
    mpv
    image-roll
    feh
    ffmpeg

    # System Managers
    btop
    stow
    home-manager

    # Files and Folders
    gvfs
    unison
    xfce.thunar
    xfce.thunar-archive-plugin
    gparted
    unzip
    unrar
    mtpfs

    # Audio
    rhythmbox
    pamixer
    playerctl

    # LSP
    rust-analyzer
    nodePackages.pyright
    fortls
    rnix-lsp
    cmake-language-server
    ccls

    # Libs
    gcc
    gfortran
    #libllvm
    clang
    clang-tools
    libcxx
    rustc
    cargo
  ];
}
