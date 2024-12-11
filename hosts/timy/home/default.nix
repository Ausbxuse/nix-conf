{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ../../../modules/common/normie/home
    ./dconf.nix
  ];

  #### Extra configs

  programs.tmux.extraConfig = builtins.readFile ../../../modules/home/tmux/tmux.conf + "\n" + builtins.readFile ./tmux.conf;

  home.activation.installTimyScripts = lib.hm.dag.entryAfter ["writeBoundary"] ''
    ${pkgs.rsync}/bin/rsync -avz --chmod=D2755,F744 ${./bin}/ ${config.home.homeDirectory}/.local/bin/
  '';

  #### extra packages
  home.packages = with pkgs; [
    xournalpp
  ];
}
