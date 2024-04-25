{
  lib,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')

    neofetch

    # archives
    zip
    xz
    unzip
    # p7zip

    # utils
    # jq # A lightweight and flexible command-line JSON processor
    # yq-go # yaml processor https://github.com/mikefarah/yq
    eza # A modern replacement for ‘ls’

    # networking tools
    # mtr # A network diagnostic tool
    # iperf3
    # dnsutils  # `dig` + `nslookup`
    # ldns # replacement of `dig`, it provide the command `drill`
    # aria2 # A lightweight multi-protocol & multi-source command-line download utility
    # socat # replacement of openbsd-netcat
    nmap # A utility for network discovery and security auditing
    # ipcalc  # it is a calculator for the IPv4/v6 addresses

    # misc
    cowsay
    file
    which
    tree
    # gnused
    # gnutar
    # gawk
    # zstd
    gnupg

    # nix related
    #
    # it provides the command `nom` works just like `nix`
    # with more details log output
    nix-output-monitor

    # btop  # replacement of htop/nmon
    # iotop # io monitoring
    iftop # network monitoring

    # system call monitoring
    strace # system call monitoring
    # ltrace # library call monitoring

    # system tools
    # sysstat
    # lm_sensors # for `sensors` command
    # ethtool
    # pciutils # lspci
    usbutils # lsusb
    killall

    # utils
    ripgrep
    htop

    # misc
    libnotify
    xdg-utils

    # productivity
    obsidian

    # JS
    nodejs
    nodePackages.npm
    nodePackages.pnpm
    yarn
  ];

  programs = {
    # tmux = {
    # };

    # bat = {
    #   enable = true;
    #   config = {
    #     pager = "less -FR";
    #     # theme = "catppuccin-mocha";
    #   };
    #   themes = {
    #     # https://raw.githubusercontent.com/catppuccin/bat/main/Catppuccin-mocha.tmTheme
    #     catppuccin-mocha = {
    #       src = catppuccin-bat;
    #       file = "Catppuccin-mocha.tmTheme";
    #     };
    #   };
    # };

    btop.enable = true; # replacement of htop/nmon
    eza.enable = true; # A modern replacement for ‘ls’
    # ssh.enable = true;

    # skim = {
    #   enable = true;
    #   enableZshIntegration = true;
    #   defaultCommand = "rg --files --hidden";
    #   changeDirWidgetOptions = [
    #     "--preview 'exa --icons --git --color always -T -L 3 {} | head -200'"
    #     "--exact"
    #   ];
    # };
  };
}
