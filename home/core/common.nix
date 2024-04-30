{
  lib,
  pkgs,
  config,
  ...
}: {
  home.packages = with pkgs; [
    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    (nerdfonts.override {fonts = ["JetBrainsMono"];})

    gnomeExtensions.astra-monitor
    gnomeExtensions.gnome-bedtime
    gnomeExtensions.night-light-slider-updated
    gnomeExtensions.hide-cursor
    gnomeExtensions.unite
    gnomeExtensions.blur-my-shell
    gnomeExtensions.forge
    gnomeExtensions.rounded-window-corners
    gnomeExtensions.kimpanel
    gnomeExtensions.system-monitor-next
    gnomeExtensions.net-speed-simplified
    gnomeExtensions.gsconnect
    gnomeExtensions.caffeine
    gnomeExtensions.paperwm
    gnomeExtensions.cronomix
    gnomeExtensions.coverflow-alt-tab
    gnomeExtensions.color-picker
    gnomeExtensions.bluetooth-battery-meter
    gnomeExtensions.just-perfection
    gnome.cheese
    gnome-graphs
    dconf2nix
    texlab
    plots
    gh
    jupyter

    firefox
    tree
    discord
    alacritty
    ueberzugpp
    libreoffice
    # Developer
    lua-language-server
    ruff-lsp
    ltex-ls
    marksman
    nodePackages.pyright
    nodePackages.prettier
    gimp
    font-manager
    foliate
    # User
    zathura
    bat
    nyancat
    gnumake
    pre-commit
    cowsay
    file
    gnupg
    iftop
    libnotify
    neofetch
    nix-output-monitor
    shfmt
    nmap
    nodePackages.npm
    nodePackages.pnpm
    nodejs
    obsidian
    ripgrep
    strace # system call monitoring
    tree
    unzip

    texlive.combined.scheme-full
    usbutils # lsusb
    xdg-utils
    xz
    yarn
    zip
    obs-studio
    sxiv
    home-manager
    neocmakelsp
    wl-clipboard
    scrcpy
    alejandra
    xournalpp
    mpv
    stylua
    android-tools
    calibre
    imv
    nh
    nvd
  ];

  programs = {
    brave.enable = true;
    btop.enable = true; # replacement of htop/nmon
    eza.enable = true; # A modern replacement for ‘ls’
    git = {
      enable = true;

      userName = "Zhenyu Zhao";
      userEmail = "peterzhaozzy@gmail.com";
    };
  };
}
