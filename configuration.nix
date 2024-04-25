# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).
{
  config,
  lib,
  pkgs,
  ...
}: {
  environment.sessionVariables = {
    MUTTER_DEBUG = "color";
  };

  system.copySystemConfiguration = true;
  nixpkgs.config.allowUnfree = true;
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    <home-manager/nixos>
  ];

  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  nix.settings.experimental-features = ["nix-command" "flakes"];

  # Use the systemd-boot EFI boot loader.
  programs.neovim.enable = true;
  programs.neovim.defaultEditor = true;
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "nixuse"; # Define your hostname.
  # Pick only one of the below networking options.
  #networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.networkmanager.enable = true; # Easiest to use and most distros use this by default.

  # Set your time zone.
  time.timeZone = "US/Pacific";

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  #   useXkbConfig = true; # use xkb.options in tty.
  # };

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  /*
     services.xserver.displayManager.sddm.enable = false;
  services.xserver.desktopManager.plasma6.enable = false;
  */

  # Configure keymap in X11
  # services.xserver.xkb.layout = "us";
  # services.xserver.xkb.options = "eurosign:e,caps:escape";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound.
  hardware.pulseaudio.enable = false;
  # OR
  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
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
    unclutter-xfixes
    texlive.combined.scheme-medium
    openvpn3
    lua-language-server
    ruff-lsp
    ltex-ls
    marksman
    nodePackages.pyright
  ];

  programs.defaults.defaults = {
    "application/pdf" = [pkgs.zathura "${pkgs.evince}/share/applications/org.gnome.Evince.desktop"];
    "inode/directory" = [pkgs.yazi];
    "video/mp4" = pkgs.mpv;
    "image/png" = pkgs.sxiv;
    "image/jpg" = pkgs.sxiv;
  };

  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:
  services.unclutter.enable = true;
  services.xserver.displayManager.gdm.settings = {
    Theme = {
      CursorTheme = "capitaine-cursors-light";
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

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  networking.firewall.enable = false;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
  # to actually do that.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  # fileSystems. "/boot" = {
  # 	device = "/dev/disk/by-label/BOOT";
  #       fsType= "fat32";
  # };

  system.stateVersion = "24.05"; # Did you read the comment?
  #boot.initrd.luks.devices = {
  #        crypted = {
  #      	  device = "/dev/disk/by-uuid/3f14ceeb-fe2b-4360-974b-695004b8b640";
  #      	  preLVM = true;
  #      	  allowDiscards = true;
  #        };
  #};

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
  /*
       services.redshift = {
       enable = true;
       brightness = {
  # Note the string values below.
  day = "1";
  night = "1";
  };
  temperature = {
  day = 5500;
  night = 3700;
  };
  };

  location = {
  provider = "manual";
  latitude = 34.023220;
  longitude = -118.302747;
  };
  */
}
