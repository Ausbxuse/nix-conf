{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./common.nix
    ./alacritty.nix
    ./tmux
    ./zsh
  ];

  home.activation.installNvim = lib.hm.dag.entryAfter ["writeBoundary"] ''
    ${pkgs.rsync}/bin/rsync -avz --chmod=D2755,F744 ${./nvim}/ ${config.xdg.configHome}/nvim/
  '';

  programs = {
    neovim = {
      enable = true;

      defaultEditor = true;
      viAlias = true;
      vimAlias = true;
    };
  };
}
