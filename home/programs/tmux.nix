{
  config,
  lib,
  pkgs,
  ...
}: {
  home.activation.installTmux = lib.hm.dag.entryAfter ["writeBoundary"] ''
    ${pkgs.rsync}/bin/rsync -avz --chmod=D2755,F744 ${./tmux/plugins/tpm}/ ${config.xdg.configHome}/tmux/plugins/tpm/
  '';
  home.file.".config/tmux" = {
    source = ./tmux;
    recursive = true;
  };
}
