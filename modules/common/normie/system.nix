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
    inputs.grub2-theme.nixosModules.default
  ];
  environment.systemPackages = with pkgs; [
    openvpn
    distrobox
  ];

  i18n.inputMethod = {
    enable = true;
    type = "ibus";
    ibus.engines = with pkgs.ibus-engines; [
      libpinyin
      typing-booster-unwrapped
    ];
  };

  boot.binfmt.emulatedSystems = ["aarch64-linux"]; # for distrobox to emulate arm
  virtualisation.podman = {
    enable = true;
    dockerCompat = true;
  };
  xdg.portal = {
    enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
      pkgs.xdg-desktop-portal-hyprland
    ];
  };
}
