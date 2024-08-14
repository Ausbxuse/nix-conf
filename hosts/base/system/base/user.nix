{
  config,
  lib,
  inputs,
  options,
  pkgs,
  username,
  user-homedir,
  ...
}: {
  programs.zsh.enable = true;
  programs.tmux.enable = true;

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  users.defaultUserShell = pkgs.zsh;
  users.users.${username} = {
    isNormalUser = true;
    extraGroups = ["wheel" "networkmanager" "video"]; # Enable ‘sudo’ for the user.
    home = "${user-homedir}";
    createHome = true;
  };

  security.sudo = {
    enable = true;
    extraRules = [
      {
        commands = [
          {
            command = "/usr/bin/env";
            options = ["NOPASSWD"];
          }
        ];
        groups = ["wheel"];
      }
    ];
  };
}
