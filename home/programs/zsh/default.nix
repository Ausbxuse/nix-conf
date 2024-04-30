{
  config,
  lib,
  pkgs,
  ...
}: {
  home.activation.installZsh = lib.hm.dag.entryAfter ["writeBoundary"] ''
    ${pkgs.rsync}/bin/rsync -avz --chmod=D2755,F744 ${./zsh}/ ${config.xdg.configHome}/zsh/
  '';
  # programs.zsh = {
  #   enable = true;
  #   enableCompletion = true;
  #   autosuggestion.enable = true;
  #   syntaxHighlighting.enable = true;

  #   shellAliases = {
  #     ll = "ls -l";
  #   };
  #   history.size = 10000;
  #   history.path = "${config.xdg.dataHome}/zsh/history";
  # };
}
