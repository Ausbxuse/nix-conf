{
  lib,
  pkgs,
  config,
  ...
}: {
  programs = {
    ghostty = {
      # TODO: finish configs
      enable = true;
    };
  };

  home.activation.installGhosttyConfig = lib.hm.dag.entryAfter ["writeBoundary"] ''
    ${pkgs.rsync}/bin/rsync -avz --chmod=D2755,F744 ${./config} ${config.xdg.configHome}/ghostty/
  '';
}
