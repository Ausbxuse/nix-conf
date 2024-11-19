{
  config,
  lib,
  pkgs,
  ...
}: {
  home.activation.installTmux = lib.hm.dag.entryAfter ["writeBoundary"] ''
    ${pkgs.rsync}/bin/rsync -avz --chmod=D2755,F744 ${./tmux}/ ${config.xdg.configHome}/tmux/
  '';
  programs.tmux.enable = true;
  programs.tmux.extraConfig = lib.mkDefault (builtins.readFile ./tmux.conf);
}
