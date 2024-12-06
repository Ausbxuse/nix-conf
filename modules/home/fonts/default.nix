{
  config,
  lib,
  pkgs,
  ...
}: {
  home.activation.installFonts = lib.hm.dag.entryAfter ["writeBoundary"] ''
    ${pkgs.rsync}/bin/rsync -avz --chmod=D2755,F744 ${./fonts}/ ${config.xdg.dataHome}/fonts/
  '';
}
