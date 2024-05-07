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
    ./gaming
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
  environment.sessionVariables = rec {
    XDG_CACHE_HOME = "$HOME/.cache";
    XDG_CONFIG_HOME = "$HOME/.config";
    XDG_DATA_HOME = "$HOME/.local/share";
    XDG_STATE_HOME = "$HOME/.local/state";
    XDG_BIN_HOME = "$HOME/.local/bin";
    PATH = [
      "${XDG_BIN_HOME}" # can remove because the nextline includes it
      "$(du ${XDG_BIN_HOME} | cut -f2 | paste -sd ':')"
    ];

    XCURSOR_THEME = "capitaine-cursors-white";
    NPM_PACKAGES = "$HOME/.local/share/npm";
    ZK_NOTEBOOK_DIR = "$HOME/Documents/Notes";
    EDITOR = "nvim";
    TERMINAL = "alacritty";
    BROWSER = "firefox";
    GTK2_RC_FILES = "${XDG_CONFIG_HOME}/gtk-2.0/gtkrc-2.0";
    LESSHISTFILE = "-";
    WGETRC = "${XDG_CONFIG_HOME}/wget/wgetrc";
    INPUTRC = "${XDG_CONFIG_HOME}/shell/inputrc";
    ZDOTDIR = "${XDG_CONFIG_HOME}/zsh";
    WINEPREFIX = "${XDG_DATA_HOME}/wineprefixes/default";
    PASSWORD_STORE_DIR = "${XDG_DATA_HOME}/password-store";
    TMUX_TMPDIR = ''$XDG_RUNTIME_DIR'';
    ANDROID_SDK_HOME = "${XDG_CONFIG_HOME}/android";
    ANDROID_SDK = "${XDG_CONFIG_HOME}/android/Android/Sdk";
    ANDROID_AVD_HOME = "${XDG_DATA_HOME}/android/";
    ANDROID_EMULATOR_HOME = "${XDG_DATA_HOME}/android/";
    ADB_VENDOR_KEY = "${XDG_CONFIG_HOME}/android";
    CARGO_HOME = "${XDG_DATA_HOME}/cargo";
    GOPATH = "${XDG_DATA_HOME}/go";
    ANSIBLE_CONFIG = "${XDG_CONFIG_HOME}/ansible/ansible.cfg";
    UNISON = "${XDG_DATA_HOME}/unison";
    HISTFILE = "${XDG_DATA_HOME}/history";
    SQLITE_HISTORY = "${XDG_DATA_HOME}/sqlite_history";
    NPM_CONFIG_USERCONFIG = "${XDG_CONFIG_HOME}/npm/npmrc";
    PYLINTHOME = "${XDG_DATA_HOME}/pylint";
    RUSTUP_HOME = "${XDG_DATA_HOME}/rustup";
    CONDARC = "${XDG_CONFIG_HOME}/conda/condarc";
    DICS = "/usr/share/stardict/dic/";
    FZF_DEFAULT_OPTS = "--layout=reverse --height 40%";
    FZF_DEFAULT_COMMAND = "fd . $HOME";
    FZF_CTRL_T_COMMAND = "${FZF_DEFAULT_COMMAND}";
    FZF_ALT_C_COMMAND = "fd -t d . $HOME";
  };

  services = {
    syncthing = {
      enable = true;
      user = "zhenyu";
      dataDir = "/home/zhenyu/Documents"; # Default folder for new synced folders
      configDir = "/home/zhenyu/Documents/.config/syncthing"; # Folder for Syncthing's settings and keys
      settings = {
        devices = {
          "SSU23" = {id = "JQCGOJT-ZVSXGTS-A6LVBAN-X2MSWXI-KHDG4ZY-QQNEP4J-5AQXGMG-DIFYOAU";};
        };
        folders = {
          "Documents" = {
            # Name of folder in Syncthing, also the folder ID
            path = "/home/zhenyu/Documents"; # Which folder to add to Syncthing
            devices = ["SSU23"]; # Which devices to share the folder with
            ignorePerms = false; # By default, Syncthing doesn't sync file permissions. This line enables it for this folder.
          };
          "Pictures" = {
            path = "/home/zhenyu/Pictures";
            devices = ["SSU23"];
          };
        };
      };
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
      efiSysMountPoint = "/boot"; # ← use the same mount point here.
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
      cursorTheme = "capitaine-cursors-white";
    };
  };
  services.gnome.tracker.enable = true;

  # Printing
  services.printing.enable = true;

  # Audio
  hardware.pulseaudio.enable = false;
  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  services.libinput.enable = true;

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
    gnome.networkmanager-openvpn
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
    openvpn
    pciutils
    wirelesstools
    iw
    gtop
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
      wqy_zenhei # Need by steam for Chinese
    ];
  };
}
