{pkgs, ...}: {
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.localBinInPath = true;
  environment.systemPackages = with pkgs;
    [
      # ESSENTIALs
      cachix
      gcc
      rsync
      gnupg
      pciutils
      wirelesstools
      iw
      neovim
      ncdu
      lsof
      wget
      git
      which
      htop
      pkg-config
      killall
      unzip
    ]
    ++ [
    ];
}
