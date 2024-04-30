{
  config,
  lib,
  pkgs,
  ...
}: {
  /*
  home.activation.installTmux = lib.hm.dag.entryAfter ["writeBoundary"] ''
  ${pkgs.rsync}/bin/rsync -avz --chmod=D2755,F744 ${./tmux} ${config.xdg.configHome}/tmux/plugins/tpm/
  '';
  */
  home.file.".config/tmux" = {
    source = ./tmux;
    recursive = true;
  };
  programs.tmux = {
    enable = true;
    terminal = "xterm-256color";
    mouse = true;
    historyLimit = 30000;
    baseIndex = 1;
    aggressiveResize = true;
    keyMode = "vi";
    #enableVim = true;
    #enableSensible = true;
    prefix = "C-f";
    clock24 = true;
    escapeTime = 20;
    extraConfig = ''
      run-shell ${pkgs.tmuxPlugins.cpu}/share/tmux-plugins/cpu/cpu.tmux
      run-shell ${pkgs.tmuxPlugins.prefix-highlight}/share/tmux-plugins/prefix-highlight/prefix_highlight.tmux
      run-shell ${pkgs.tmuxPlugins.battery}/share/tmux-plugins/battery/battery.tmux
      run-shell ${pkgs.tmuxPlugins.resurrect}/share/tmux-plugins/resurrect/resurrect.tmux
      run-shell ${pkgs.tmuxPlugins.continuum}/share/tmux-plugins/continuum/continuum.tmux
      run-shell ${pkgs.tmuxPlugins.tmux-fzf}/share/tmux-plugins/tmux-fzf/main.tmux
    '';
  };
}
