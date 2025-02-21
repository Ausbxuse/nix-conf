{...}: {
  # boot.initrd = {
  #   availableKernelModules = ["xhci_pci" "thunderbolt" "vmd" "nvme" "usb_storage" "usbhid" "sd_mod"];
  #   kernelModules = ["i915" "dm-snapshot"]; # Early KMS
  #   systemd.services.initrd-brightness = {
  #     unitConfig.DefaultDependencies = false;
  #     wantedBy = ["initrd.target"];
  #     requires = [
  #       ''sys-devices-pci0000:00-0000:00:02.0-drm-card1-card1\x2deDP\x2d1-intel_backlight.device''
  #       ''sys-devices-pci0000:00-0000:00:02.0-drm-card1-card1\x2deDP\x2d2-card1\x2deDP\x2d2\x2dbacklight.device''
  #     ];
  #     before = ["plymouth-start.service"];
  #     after = [
  #       ''sys-devices-pci0000:00-0000:00:02.0-drm-card1-card1\x2deDP\x2d1-intel_backlight.device''
  #       ''sys-devices-pci0000:00-0000:00:02.0-drm-card1-card1\x2deDP\x2d2-card1\x2deDP\x2d2\x2dbacklight.device''
  #     ];
  #     script = ''
  #       echo 50 > '/sys/devices/pci0000:00/0000:00:02.0/drm/card1/card1-eDP-1/intel_backlight/brightness'
  #       echo  0 > '/sys/devices/pci0000:00/0000:00:02.0/drm/card1/card1-eDP-2/card1-eDP-2-backlight/brightness'
  #     '';
  #   };
  # };
}
