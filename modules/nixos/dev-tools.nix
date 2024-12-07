{pkgs, ...}: {
  # TODO: create fzf.nix module
  environment.systemPackages = with pkgs;
    [
      # tui utils
      yazi
      fd
      ripgrep
      zoxide
      chafa
    ]
    ++ [
      # tools
      sshfs
      just
      gtop
    ];
  programs.direnv.enable = true;
  services.locate = {
    enable = true;
    localuser = null;
    package = pkgs.plocate;
  };
}