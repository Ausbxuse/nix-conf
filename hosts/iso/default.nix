{
  pkgs,
  lib,
  ...
}: {
  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = ["nix-command" "flakes"];

  i18n.defaultLocale = "en_US.UTF-8";

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";

  # services.xserver.videoDrivers = ["amd" "nvidia"];

  networking = {
    hostName = "nixos-iso";
    wireless.enable = true;
  };

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    extraPackages32 = with pkgs; [libvdpau-va-gl vaapiVdpau];
  };

  services.logind = {
    lidSwitch = "suspend";
  };

  networking.firewall = {
    enable = false;
    # allowedTCPPorts = [80 8080];
  };

  system.stateVersion = "24.05";
}
