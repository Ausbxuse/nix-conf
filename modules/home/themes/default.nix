{
  config,
  lib,
  pkgs,
  ...
}: {
  home.activation.installThemes = lib.hm.dag.entryAfter ["writeBoundary"] ''
    ${pkgs.rsync}/bin/rsync -avz --chmod=D2755,F744 ${./themes}/ ${config.xdg.dataHome}/themes/
  '';
}
