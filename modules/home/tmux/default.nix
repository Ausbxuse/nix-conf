{
  config,
  lib,
  pkgs,
  ...
}: {
  programs.tmux = {
    enable = true;
  };

  home.activation.installTmux = lib.hm.dag.entryAfter ["writeBoundary"] ''
    ${pkgs.rsync}/bin/rsync -avz --chmod=D2755,F744 ${./tmux}/ ${config.xdg.configHome}/tmux/
  '';

  programs.tmux.extraConfig = builtins.readFile ./tmux.conf;
}
