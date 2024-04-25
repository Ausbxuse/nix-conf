{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./programs
  ];

  home = {
    username = "zhenyu";
    homeDirectory = "/home/zhenyu";

    stateVersion = "23.11";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
