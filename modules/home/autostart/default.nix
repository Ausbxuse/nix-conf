{
  config,
  lib,
  pkgs,
  ...
}: {
  home.activation.installAutostart = lib.hm.dag.entryAfter ["writeBoundary"] ''
    ${pkgs.rsync}/bin/rsync -avz --chmod=D2755,F744 ${./autostart}/ ${config.xdg.configHome}/autostart/
  '';
}
