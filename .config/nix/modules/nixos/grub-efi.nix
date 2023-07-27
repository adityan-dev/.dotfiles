{ config, pkgs, ... }:
{

  console =
    {
      font = "ter-132n";
      packages = with pkgs; [ terminus_font ];
      keyMap = "us";
    };
  
  # TTY
  fonts.fonts = with pkgs; [ meslo-lgs-nf ];
  # services.kmscon =
  #   {
  #     enable = true;
  #     hwRender = true;
  #     extraConfig =
  #       ''
  #          font-name=MesloLGS NF
  #          font-size=14
  #       '';
  # };

   boot.consoleLogLevel = 0;
   boot.initrd.verbose = false;
   boot.kernelParams = [ "quiet" "splash" "rd.systemd.show_status=false" "rd.udev.log_level=3" "udev.log_priority=3" "boot.shell_on_fail" ];
   boot.loader.timeout = 5;
   boot.loader.grub.enable = true;
   boot.loader.grub.device = "nodev";
   boot.loader.grub.efiSupport = true;
   boot.loader.efi.canTouchEfiVariables = true;
   boot.loader.efi.efiSysMountPoint = "/boot";
   boot.loader.grub.useOSProber = true;
   boot.loader.grub.theme = pkgs.stdenv.mkDerivation {
    pname = "distro-grub-themes";
    version = "3.1";
    src = pkgs.fetchFromGitHub {
      owner = "AdisonCavani";
      repo = "distro-grub-themes";
      rev = "v3.1";
      hash = "sha256-ZcoGbbOMDDwjLhsvs77C7G7vINQnprdfI37a9ccrmPs=";
    };
    installPhase = "cp -r customize/nixos $out";
};
}
