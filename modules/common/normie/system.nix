{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ../../nixos/core
    ../../nixos/dev-tools.nix
    ../../nixos/luks.nix
    ../../nixos/gui/gnome.nix
    ../../nixos/gui/gaming.nix
    ../../nixos/hardware/sound.nix
    ../../nixos/hardware/printing.nix
    ../../nixos/hardware/usb.nix
  ];
  environment.systemPackages = with pkgs; [
    openvpn
    distrobox
  ];
  virtualisation.podman = {
    enable = true;
    dockerCompat = true;
  };
}
