{
  config,
  lib,
  inputs,
  options,
  pkgs,
  ...
}: let
  pkgs_kernel = import (builtins.fetchTarball {
    url = "https://github.com/NixOS/nixpkgs/archive/8348deaf95ec17e19753ff689abb753a5832912c.tar.gz";
    sha256 = "0nk8mi6wjwkqw85gpa2xr3pfjpmgl2zk2qqpzkwqjxgpyykp7inf";
  }) {system = "x86_64-linux";};
in {
  boot.initrd = {
    availableKernelModules = ["xhci_pci" "thunderbolt" "vmd" "nvme" "usb_storage" "usbhid" "sd_mod"];
    kernelModules = ["i915" "dm-snapshot"]; # Early KMS
    systemd.services.initrd-brightness = {
      unitConfig.DefaultDependencies = false;
      wantedBy = ["initrd.target"];
      requires = [
        ''sys-devices-pci0000:00-0000:00:02.0-drm-card1-card1\x2deDP\x2d1-intel_backlight.device''
        ''sys-devices-pci0000:00-0000:00:02.0-drm-card1-card1\x2deDP\x2d2-card1\x2deDP\x2d2\x2dbacklight.device''
      ];
      before = ["plymouth-start.service"];
      after = [
        ''sys-devices-pci0000:00-0000:00:02.0-drm-card1-card1\x2deDP\x2d1-intel_backlight.device''
        ''sys-devices-pci0000:00-0000:00:02.0-drm-card1-card1\x2deDP\x2d2-card1\x2deDP\x2d2\x2dbacklight.device''
      ];
      script = ''
        echo 50 > '/sys/devices/pci0000:00/0000:00:02.0/drm/card1/card1-eDP-1/intel_backlight/brightness'
        echo  0 > '/sys/devices/pci0000:00/0000:00:02.0/drm/card1/card1-eDP-2/card1-eDP-2-backlight/brightness'
      '';
    };
  };

  #boot.kernelPackages = pkgs.linuxPackages_6_9;
  #boot.kernelPackages = pkgs.linuxKernel.packages.linux_6_9;
  #boot.kernelPackages = pkgs_kernel.linuxKernel.packages.linux_6_9;
  boot.kernelPackages = pkgs_kernel.linuxKernel.packages.linux_6_9;
  boot.kernelPatches = [
    #{
    #  name = "zenbook-asus-hid";
    #  patch = ./zenbook-asus-hid.patch;
    #}
    {
      name = "zenbook-i915-revert-93cbc1accbcec2740231755774420934658e2b18";
      patch = ./kernel-patch/zenbook-i915-revert-93cbc1accbcec2740231755774420934658e2b18.patch;
    }
  ];
}
