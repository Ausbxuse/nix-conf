{...}: {
  programs = {
    firefox = {
      enable = true;
      profiles.betterfox = {
        extraConfig = builtins.readFile ./user.js;
      };
      # package = pkgs.firefox-wayland;
    };
  };
}
