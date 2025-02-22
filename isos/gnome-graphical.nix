{
  lib,
  modulesPath,
  pkgs,
  ...
}: {
  imports = [
    # "${toString modulesPath}/installer/cd-dvd/installation-cd-graphical-calamares-gnome.nix"
    "${toString modulesPath}/installer/cd-dvd/installation-cd-minimal-base.nix"
  ];

  environment.systemPackages = with pkgs; [
    tmux
    git
    just
    rsync
    curl
    wget
    disko
  ];
  programs.direnv.enable = true;
  # override installation-cd-base and enable wpa and sshd start at boot
  systemd.services.wpa_supplicant.wantedBy = lib.mkForce ["multi-user.target"];
  systemd.services.sshd.wantedBy = lib.mkForce ["multi-user.target"];

  formatAttr = "isoImage";
  fileExtension = ".iso";
  isoImage.squashfsCompression = "gzip -Xcompression-level 1";
}
