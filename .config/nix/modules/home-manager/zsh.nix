
{ config, pkgs, ... }:
{
  programs.starship.enable = true;
  programs.zsh = {
    enable = true;

    enableAutosuggestions = true;
    enableCompletion = true;
    dotDir = ".config/zsh";
    initExtra = ''
              eval "$(starship init zsh)"
              export PATH=/home/adi/.dotfiles/.config/thor:$PATH
              '';
    
    shellAliases = {
      ll = "ls -l";
      update = "sudo nixos-rebuild switch";
    };
    history = {
      size = 10000;
      path = "${config.xdg.dataHome}/zsh/history";
    };
  };
}
