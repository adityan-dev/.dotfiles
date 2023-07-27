{ config, lib, pkgs, modulesPath, ... }:
{
  fileSystems."/media/data" =
    { device = "/dev/disk/by-uuid/e0f28002-546e-4921-b366-01db4b7fd78d";
      fsType = "ext4";
    };
}
