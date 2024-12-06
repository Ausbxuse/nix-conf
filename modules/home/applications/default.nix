{
  config,
  lib,
  pkgs,
  ...
}: {
  home.activation.installApplications = lib.hm.dag.entryAfter ["writeBoundary"] ''
    ${pkgs.rsync}/bin/rsync -avz --chmod=D2755,F744 ${./applications}/ ${config.xdg.dataHome}/applications/
  '';
}
