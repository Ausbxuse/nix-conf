{
  lib,
  pkgs,
  ...
}: {
  # Boot options

  boot.kernelPackages = lib.mkDefault pkgs.linuxPackages_latest;

  boot.kernelParams = lib.mkDefault [
    "quiet"
    "splash"
    "vga=current"
    "rd.systemd.show_status=false"
    "rd.udev.log_level=3"
    "udev.log_priority=3"
  ];
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
  boot.consoleLogLevel = 0;
  boot.initrd.verbose = false;

  boot.kernelParams = lib.mkDefault [
    "quiet"
    "splash"
    "vga=current"
    "boot.shell_on_fail"
    "loglevel=3"
    "rd.systemd.show_status=false"
    "rd.udev.log_level=3"
    "udev.log_priority=3"
  ];
}
