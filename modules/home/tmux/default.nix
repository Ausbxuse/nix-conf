{
  config,
  lib,
  pkgs,
  ...
}: {
  programs.tmux = {
    enable = true;
  };

  home.packages = with pkgs; [
    lm_sensors
  ];

  home.activation.installTmux = lib.hm.dag.entryAfter ["writeBoundary"] ''
    ${pkgs.rsync}/bin/rsync -avz --chmod=D2755,F744 ${./tmux}/ ${config.xdg.configHome}/tmux/
  '';

  programs.tmux = {
    extraConfig = builtins.readFile ./tmux.conf;
    keyMode = "vi";
    baseIndex = 1;
    escapeTime = 20;
    historyLimit = 30000;
    aggressiveResize = true;
    clock24 = true;
    terminal = "tmux-256color";
    mouse = true;
  };
}
