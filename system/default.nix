# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).
{
  config,
  lib,
  inputs,
  pkgs,
  ...
}: {
  imports = [
    # Include the results of the hardware scan.
    # ./disk
    # ./hardware
    ./hardware-configuration.nix
  ];

  # user
  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;
  users.users.zhenyu = {
    isNormalUser = true;
    extraGroups = ["wheel" "networkmanager" "video"]; # Enable ‘sudo’ for the user.
    home = "/home/zhenyu";
    createHome = true;
  };

  services = {
    syncthing = {
      enable = true;
      user = "zhenyu";
      dataDir = "/home/zhenyu/Documents"; # Default folder for new synced folders
      configDir = "/home/zhenyu/Documents/.config/syncthing"; # Folder for Syncthing's settings and keys
    };
  };

  time.timeZone = "US/Pacific";
  i18n.defaultLocale = "en_US.UTF-8";

  environment.sessionVariables = {
    MUTTER_DEBUG = "color";
  };

  system.stateVersion = "24.05";
  # system.copySystemConfiguration = false;

  nixpkgs.config.allowUnfree = true;

  nix.settings.experimental-features = ["nix-command" "flakes"];

  # Boot options
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
      # enableCryptodisk= true;
      #efiInstallAsRemovable = true; # in case canTouchEfiVariables doesn't work for your system
      device = "nodev";
    };
    grub2-theme = {
      enable = true;
    };
  };

  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.plymouth.enable = true;
  boot.plymouth.theme = "breeze";
  boot.initrd.availableKernelModules = ["xhci_pci" "thunderbolt" "vmd" "nvme" "usb_storage" "usbhid" "sd_mod"];
  boot.initrd.kernelModules = ["dm-snapshot"];
  boot.kernelModules = ["kvm-intel"];
  boot.extraModulePackages = [];
  boot.kernelParams = [
    "quiet"
    "splash"
    "vga=current"
    "rd.systemd.show_status=false"
    "rd.udev.log_level=3"
    "udev.log_priority=3"
  ];

  # Networking
  networking.hostName = "nixuse";
  networking.networkmanager.enable = true;

  # DE
  services.xserver.enable = true;
  services.xserver.desktopManager.gnome.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.displayManager.gdm.settings = {
    Theme = {
      CursorTheme = "capitaine-cursors-white";
    };
  };

  # Printing
  services.printing.enable = true;

  # Audio
  hardware.pulseaudio.enable = false;
  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  services.xserver.libinput.enable = true;

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

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.localBinInPath = true;
  environment.systemPackages = with pkgs; [
    gnome.gnome-shell-extensions
    gnome.dconf-editor
    gnome.gnome-tweaks
    gnome-extension-manager
    capitaine-cursors
    lua51Packages.luarocks-nix
    pinentry
    pass
    yazi
    neovim
    rustup
    sdcv
    pkg-config
    gnupg
    iio-sensor-proxy
    usbutils
    sshfs
    R
    python3
    # syncthing
    wget
    git
    tmux
    nodejs
    which
    zsh
    bash
    zoxide
    htop
    killall
    plocate
    ripgrep
    ncdu
    lsof
    chafa
    fd
    fzf
    gcc
    rsync
    trash-cli
    lazygit
    unzip
    tree-sitter
    inotify-tools
    texlive.combined.scheme-medium
    openvpn3
  ];

  # nix-ld
  # gnupg, mtrj

  networking.firewall.enable = false;

  fonts = {
    fontDir.enable = true;
    packages = with pkgs; [
      jetbrains-mono
      # nerdfonts
      noto-fonts-emoji-blob-bin
      source-han-sans
    ];
  };
}
