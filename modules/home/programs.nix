# terminal apps
{pkgs, ...}: {
  home.packages = with pkgs; [
    inotify-tools
    xdg-utils # provides cli tools such as `xdg-mime` `xdg-open`
    #xdg-user-dirs
    pre-commit
    cowsay
    file
    htop
    gnupg
    nmap
    iftop
    tree
    xz
    zip
    strace # system call monitoring
    lazygit
    #texlive.combined.scheme-full
  ];
}
