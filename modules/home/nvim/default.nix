{
  config,
  lib,
  pkgs,
  ...
}: let
  nvimPath = "${config.home.homeDirectory}/src/public/nix-conf/modules/home/nvim/nvim";
in {
  xdg.configFile."nvim".source = config.lib.file.mkOutOfStoreSymlink nvimPath;

  home.packages = with pkgs; [
    # lua51Packages.luarocks-nix
    # fortune
    nodejs
    tree-sitter
    # inotify-tools
    fd
    ripgrep
    pre-commit
    file
    # jdk
    # cargo
    gcc
  ];

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    # extraWrapperArgs = with pkgs; [
    #   # LIBRARY_PATH is used by gcc before compilation to search directories
    #   # containing static and shared libraries that need to be linked to your program.
    #   "--suffix"
    #   "LIBRARY_PATH"
    #   ":"
    #   "${lib.makeLibraryPath [stdenv.cc.cc zlib]}"
    #
    #   # PKG_CONFIG_PATH is used by pkg-config before compilation to search directories
    #   # containing .pc files that describe the libraries that need to be linked to your program.
    #   "--suffix"
    #   "PKG_CONFIG_PATH"
    #   ":"
    #   "${lib.makeSearchPathOutput "dev" "lib/pkgconfig" [stdenv.cc.cc zlib]}"
    # ];
  };

  # home.activation.installNvim = lib.hm.dag.entryAfter ["writeBoundary"] ''
  #   ${pkgs.rsync}/bin/rsync -avz --chmod=D2755,F744 ${./nvim}/ ${config.xdg.configHome}/nvim/
  # '';
}
