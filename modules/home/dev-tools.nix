{pkgs, ...}: {
  home.packages = with pkgs; [
    htop
    iftop
    nmap
    tree
    alejandra
    lazygit
  ];
}
