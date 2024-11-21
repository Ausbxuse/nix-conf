{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ../../base/home
  ];

  # Overrides
  programs.zsh.initExtra = builtins.readFile ./tui/zsh-config/zshrc;
  programs.tmux.extraConfig = builtins.readFile ../../base/home/tui/tmux-config/tmux.conf + "\n" + builtins.readFile ./tui/tmux-config/tmux.conf;

  home.activation.installStartupScript = lib.hm.dag.entryAfter ["writeBoundary"] ''
    ${pkgs.rsync}/bin/rsync -avz --chmod=D2755,F744 ${./tui/bin}/ ${config.home.homeDirectory}/.local/bin/
  '';
}
