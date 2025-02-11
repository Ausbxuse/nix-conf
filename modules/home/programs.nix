{pkgs, ...}: {
  home.packages = with pkgs; [
    inotify-tools
    xdg-utils # provides cli tools such as `xdg-mime` `xdg-open`
    #xdg-user-dirs
    gh
    #gnumake
    pre-commit
    cowsay
    file
    jdk
    cargo
    gcc
    htop
    gnupg
    iftop
    nix-output-monitor
    shfmt
    nmap
    #nodePackages.npm
    #nodePackages.pnpm
    strace # system call monitoring
    tree
    unzip
    xz
    yarn
    zip
    home-manager
    alejandra
    #nh
    #nvd
    gdb
    eza
    btop
    lazygit
    #texlive.combined.scheme-full
  ];
}
