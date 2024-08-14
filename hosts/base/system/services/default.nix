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
    syncthing = {
      enable = true;
      user = "${username}";
      dataDir = "${user-homedir}/Public"; # Default folder for new synced folders
      configDir = "${user-homedir}/.config/syncthing"; # Folder for Syncthing's settings and keys
      settings = {
        devices = {
          "SSU23" = {id = "JQCGOJT-ZVSXGTS-A6LVBAN-X2MSWXI-KHDG4ZY-QQNEP4J-5AQXGMG-DIFYOAU";};
        };
        folders = {
          "Public" = {
            path = "${user-homedir}/Public"; # Which folder to add to Syncthing
            devices = ["SSU23"]; # Which devices to share the folder with
            ignorePerms = false; # By default, Syncthing doesn't sync file permissions. This line enables it for this folder.
          };
          "Fleeting" = {
            path = "${user-homedir}/Documents/Fleeting"; 
            devices = ["SSU23"]; 
            ignorePerms = false; 
          };
          "Phone-Media" = {
            path = "${user-homedir}/Media/Phone";
            devices = ["SSU23"];
            ignorePerms = false;
          };
        };
      };
    };
  };
}
