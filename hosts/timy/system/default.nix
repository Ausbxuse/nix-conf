# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).
{...}: {
  imports = [
    ../../base/system

    ./kernel.nix

    ./hardware-configuration.nix

    ../../base/system/gaming.nix
  ];

  virtualisation.virtualbox.host.enable = true;
  users.extraGroups.vboxusers.members = ["user-with-access-to-virtualbox"];
  location.provider = "manual";
  location.latitude = 30.0;
  location.longitude = -100.0;
  services.redshift = {
    enable = true;
    brightness = {
      day = "1";
      night = "1";
    };
    temperature = {
      day = 2700;
      night = 2700;
    };
  };
  services.touchegg.enable = true;
}
