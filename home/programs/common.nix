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
    (nerdfonts.override {fonts = ["JetBrainsMono"];})

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')

    just
    cowsay
    eza
    file
    gnupg
    htop
    iftop # network monitoring
    killall
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
    usbutils # lsusb
    which
    xdg-utils
    xz
    yarn
    zip
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

    brave.enable = true;
    btop.enable = true; # replacement of htop/nmon
    eza.enable = true; # A modern replacement for ‘ls’

    neovim.enable = true;
    neovim.defaultEditor = true;
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
