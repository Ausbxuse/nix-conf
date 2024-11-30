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
      pass
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

      # Hardware
      usbutils
      iio-sensor-proxy
      pulseaudio # provides `pactl`, which is required by some apps(e.g. sonic-pi)

      # Workflow
      sshfs
      yazi
      fzf
      fd
      ripgrep
      zoxide
      chafa
      lazygit
      trash-cli
      just

      # idk
      lua51Packages.luarocks-nix
      pinentry

      # utilities
      sdcv
      nodejs
      unzip
      tree-sitter
      inotify-tools
      openvpn
      gtop

      # gui
      xsel
    ]
    ++ [
    ];
  programs.direnv.enable = true;
  services.locate = {
    enable = true;
    localuser = null;
    package = pkgs.plocate;
  };
}
