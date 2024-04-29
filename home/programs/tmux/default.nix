{
  config,
  lib,
  pkgs,
  ...
}: {
  home.activation.installAstroNvim = lib.hm.dag.entryAfter ["writeBoundary"] ''
    ${pkgs.rsync}/bin/rsync -avz --chmod=D2755,F744 ${./tmux}/ ${config.xdg.configHome}/tmux/
  '';
  programs.tmux = {
    enable = true;
    extraConfig = ''
      run-shell ${pkgs.tmuxPlugins.cpu}/share/tmux-plugins/cpu/cpu.tmux
      run-shell ${pkgs.tmuxPlugins.sensible}/share/tmux-plugins/sensible/sensible.tmux
      run-shell ${pkgs.tmuxPlugins.prefix-highlight}/share/tmux-plugins/prefix-highlight/prefix-highlight.tmux
      run-shell ${pkgs.tmuxPlugins.battery}/share/tmux-plugins/battery/battery.tmux
      run-shell ${pkgs.tmuxPlugins.resurrect}/share/tmux-plugins/resurrect/resurrect.tmux
      run-shell ${pkgs.tmuxPlugins.continuum}/share/tmux-plugins/continuum/continuum.tmux
      run-shell ${pkgs.tmuxPlugins.tmux-fzf}/share/tmux-plugins/tmux-fzf/tmux-fzf.tmux
    '';
  };
}
