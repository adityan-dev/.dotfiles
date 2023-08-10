{ config, pkgs, ... }:
{
  sound.enable = true;
  security.rtkit.enable = true;
  hardware.pulseaudio.enable = false;
  hardware.enableAllFirmware = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  environment.systemPackages = with pkgs;
    [
      pavucontrol
      pulseaudio
    ];
}
