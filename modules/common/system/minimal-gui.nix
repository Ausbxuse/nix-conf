{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./minimal.nix
    ../../nixos/luks.nix
    ../../nixos/gui/gnome.nix
    ../../nixos/hardware/sound.nix
    ../../nixos/hardware/printing.nix
    ../../nixos/hardware/usb.nix
    inputs.grub2-theme.nixosModules.default
  ];
  environment.systemPackages = with pkgs; [
    openvpn
  ];

  i18n.inputMethod = {
    enable = true;
    type = "ibus";
    ibus.engines = with pkgs.ibus-engines; [
      libpinyin
      typing-booster-unwrapped
    ];
  };
}
