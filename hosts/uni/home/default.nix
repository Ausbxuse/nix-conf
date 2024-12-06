{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ../../base/home
    ./dconf.nix
  ];

  # Overrides
  programs.tmux.extraConfig = builtins.readFile ../../base/home/tui/tmux.conf + "\n" + builtins.readFile ./tmux.conf;

  home.activation.installUniStartupScript = lib.hm.dag.entryAfter ["writeBoundary"] ''
    ${pkgs.rsync}/bin/rsync -avz --chmod=D2755,F744 ${./bin}/ ${config.home.homeDirectory}/.local/bin/
  '';
}
