{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ../../../modules/common/normie/home
    ./dconf.nix
  ];

  home.activation.installUniStartupScript = lib.hm.dag.entryAfter ["writeBoundary"] ''
    ${pkgs.rsync}/bin/rsync -avz --chmod=D2755,F744 ${./bin}/ ${config.home.homeDirectory}/.local/bin/
  '';
}
