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
  services = {
    openssh = {
      enable = true;
      settings.PasswordAuthentication = true;
    };
    printing.enable = true;
  };
}
