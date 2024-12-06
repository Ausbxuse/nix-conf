{
  config,
  lib,
  pkgs,
  ...
}: {
  home.activation.installWallpapers = lib.hm.dag.entryAfter ["writeBoundary"] ''
    ${pkgs.rsync}/bin/rsync -avz --chmod=D2755,F744 ${./wallpapers}/ ${config.xdg.dataHome}/wallpapers/
  '';
}
