{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    distrobox
  ];

  boot.binfmt.emulatedSystems = ["aarch64-linux"]; # for distrobox to emulate arm
  virtualisation.podman = {
    enable = true;
    dockerCompat = true;
  };

  virtualisation.virtualbox.host.enable = true;
  users.extraGroups.vboxusers.members = ["user-with-access-to-virtualbox"];
}
