# for language specific packages (e.g. linters, debuggers, compilers)
{pkgs, ...}: {
  home.packages = with pkgs; [
    #nh
    #nvd
    #gnumake
    #nodePackages.npm
    #nodePackages.pnpm
    yarn
    nodePackages.prettier
    shfmt
    jdk
    cargo
    gcc
    gdb
    alejandra
    stylua
    black
    isort
  ];
}
