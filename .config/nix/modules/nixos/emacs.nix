{ config, pkgs, ... }:
{
  services.emacs = {
    enable = true;
    package = pkgs.emacs29-pgtk;
  };
  
  environment.systemPackages = with pkgs; [
    ((emacsPackagesFor emacs29-pgtk).emacsWithPackages (epkgs: [
      epkgs.vterm
    ]))
  ];
}
