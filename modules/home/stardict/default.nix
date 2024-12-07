{
  config,
  lib,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    sdcv
  ];
  home.activation.installDict = lib.hm.dag.entryAfter ["writeBoundary"] ''
    ${pkgs.rsync}/bin/rsync -avz --chmod=D2755,F744 ${./stardict}/ ${config.xdg.dataHome}/stardict/
  '';
}
