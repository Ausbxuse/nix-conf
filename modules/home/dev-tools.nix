{pkgs, ...}: {
  home.packages = with pkgs; [
    htop
    iftop
    nmap
    tree
    home-manager
    alejandra
    lazygit
  ];
}
