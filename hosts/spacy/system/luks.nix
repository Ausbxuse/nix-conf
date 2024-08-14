{
  config,
  lib,
  pkgs,
  modulesPath,
  ...
}: {
  boot.initrd.luks.devices = {
    crypted = {
      device = "/dev/disk/by-partlabel/primary";
      preLVM = true;
      allowDiscards = true;
    };
  };
}
