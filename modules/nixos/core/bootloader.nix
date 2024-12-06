{
  config,
  lib,
  inputs,
  options,
  pkgs,
  ...
}: {
  # Boot options
  boot.loader = {
    systemd-boot.enable = false;
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot"; # ← use the same mount point here.
    };
    grub = {
      enable = true;
      efiSupport = true;
      useOSProber = true;
      # enableCryptodisk= true;
      #efiInstallAsRemovable = true; # in case canTouchEfiVariables doesn't work for your system
      device = "nodev";
    };
    grub2-theme = {
      enable = true;
      screen = "4k";
    };
  };

  boot.plymouth.enable = true;
  boot.plymouth.theme = "breeze";
}
