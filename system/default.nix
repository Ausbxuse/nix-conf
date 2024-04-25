# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).
{
  config,
  lib,
  inputs,
  pkgs,
  ...
}: {
  environment.sessionVariables = {
    MUTTER_DEBUG = "color";
  };

  system.copySystemConfiguration = false;
  nixpkgs.config.allowUnfree = true;
  imports = [
    # Include the results of the hardware scan.
    # ./disk
    # ./hardware
    ./hardware-configuration.nix
  ];

  nix.settings.experimental-features = ["nix-command" "flakes"];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = false;
  #boot.loader.efi.canTouchEfiVariables = true;
  boot.loader = {
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot/efi"; # ← use the same mount point here.
    };
    grub = {
      enable = true;
      efiSupport = true;
      version = 2;
      #efiInstallAsRemovable = true; # in case canTouchEfiVariables doesn't work for your system
      device = "nodev";
    };
    grub2-theme = {
      enable = true;
    };
  };

  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "nixuse";
  # Pick only one of the below networking options.
  #networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.networkmanager.enable = true;

  time.timeZone = "US/Pacific";

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  i18n.defaultLocale = "en_US.UTF-8";
  services.xserver.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;
  /*
     services.xserver.displayManager.sddm.enable = false;
  services.xserver.desktopManager.plasma6.enable = false;
  */

  # Configure keymap in X11
  # services.xserver.xkb.layout = "us";
  # services.xserver.xkb.options = "eurosign:e,caps:escape";

  services.printing.enable = true;

  hardware.pulseaudio.enable = false;
  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  services.xserver.libinput.enable = true;

  users.defaultUserShell = pkgs.zsh;
  users.users.zhenyu = {
    isNormalUser = true;
    extraGroups = ["wheel" "networkmanager" "video"]; # Enable ‘sudo’ for the user.
    home = "/home/zhenyu";
    createHome = true;
    packages = with pkgs; [
      firefox
      tree
      discord
      alacritty
      kdeconnect
      ueberzug
      libreoffice
    ];
  };
  services.locate = {
    enable = true;
    localuser = null;
    package = pkgs.plocate;
  };
  security.sudo = {
    enable = true;
    extraRules = [
      {
        commands = [
          {
            command = "/usr/bin/env";
            options = ["NOPASSWD"];
          }
        ];
        groups = ["wheel"];
      }
    ];
  };

  services = {
    syncthing = {
      enable = true;
      user = "zhenyu";
      dataDir = "/home/zhenyu/Documents"; # Default folder for new synced folders
      configDir = "/home/zhenyu/Documents/.config/syncthing"; # Folder for Syncthing's settings and keys
    };
  };
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.localBinInPath = true;
  environment.systemPackages = with pkgs; [
    gnome.gnome-shell-extensions
    gnome.dconf-editor
    gnome.gnome-tweaks
    gnome-extension-manager
    gnomeExtensions.tiling-assistant
    gnomeExtensions.gnome-bedtime
    gnomeExtensions.night-light-slider-updated
    gnomeExtensions.hide-cursor
    # gnomeExtensions.rounded-corners
    gnomeExtensions.unite
    gnomeExtensions.blur-my-shell
    gnomeExtensions.forge
    gnomeExtensions.rounded-window-corners
    gnomeExtensions.kimpanel
    gnomeExtensions.system-monitor-next
    gnomeExtensions.net-speed-simplified
    gnomeExtensions.gsconnect
    # gnomeExtensions.vitals
    gnomeExtensions.caffeine
    gnomeExtensions.paperwm
    gnomeExtensions.cronomix
    gnomeExtensions.coverflow-alt-tab
    # gnomeExtensions.desk-changer
    gnomeExtensions.color-picker
    gnomeExtensions.bluetooth-battery-meter
    gnome-graphs
    plots
    capitaine-cursors
    lua51Packages.luarocks-nix
    pinentry
    pass
    yazi
    alejandra
    neovim
    rustup
    sdcv
    pkg-config
    obs-studio
    gnupg
    iio-sensor-proxy
    usbutils
    sshfs
    R
    python3
    wluma
    syncthing
    wget
    git
    tmux
    nodejs
    zsh
    bash
    zoxide
    nyancat
    htop
    plocate
    ripgrep
    mpv
    ncdu
    lsof
    bat
    chafa
    eza
    fd
    fzf
    gcc
    rsync
    sxiv
    scrcpy
    trash-cli
    zathura
    neocmakelsp
    xournalpp
    foliate
    font-manager
    gimp
    lazygit
    unzip
    wl-clipboard
    tree-sitter
    inotify-tools
    # unclutter
    texlive.combined.scheme-medium
    openvpn3
    lua-language-server
    ruff-lsp
    ltex-ls
    marksman
    nodePackages.pyright
    nodePackages.prettier
    neofetch
  ];

  programs.zsh.enable = true;

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  services.xserver.displayManager.gdm.settings = {
    Theme = {
      CursorTheme = "capitaine-cursors-white";
    };
  };
  /*
     programs.nix-ld.enable = true;

  # Sets up all the libraries to load
  programs.nix-ld.libraries = with pkgs; [
    stdenv.cc.cc
    zlib
    fuse3
    icu
    zlib
    nss
    openssl
    curl
    expat
    # ...
  ];
  */

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  networking.firewall.enable = false;

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .

  system.stateVersion = "24.05"; # Did you read the comment?

  fonts = {
    fontDir.enable = true;
    packages = with pkgs; [
      jetbrains-mono
      nerdfonts
      noto-fonts-emoji-blob-bin
      source-han-sans
    ];
  };

  i18n.inputMethod = {
    enabled = "fcitx5";
    fcitx5.addons = with pkgs; [
      fcitx5-rime
      fcitx5-gtk
      fcitx5-chinese-addons
      librime
    ];
  };
}
