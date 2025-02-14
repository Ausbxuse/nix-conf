{pkgs, ...}: {
  # TODO: create fzf.nix module
  environment.systemPackages = with pkgs; [
    home-manager
    sshfs
    just
  ];
  programs.direnv.enable = true;
  services.locate = {
    enable = true;
    package = pkgs.plocate;
  };
}
