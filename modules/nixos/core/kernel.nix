{
  lib,
  pkgs,
  ...
}: {
  boot.kernelPackages = lib.mkDefault pkgs.linuxPackages_latest;

  boot.kernelParams = lib.mkDefault [
    "quiet"
    "splash"
    "vga=current"
    "rd.systemd.show_status=false"
    "rd.udev.log_level=3"
    "udev.log_priority=3"
  ];
}
