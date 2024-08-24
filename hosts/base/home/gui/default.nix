{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./xdg.nix
    ./gaming
  ];

  i18n.inputMethod = {
    enabled = "fcitx5";
    fcitx5.addons = with pkgs; [
      fcitx5-rime
      fcitx5-gtk
      fcitx5-chinese-addons
      librime
    ];
  };

  home.activation.installThemes = lib.hm.dag.entryAfter ["writeBoundary"] ''
    ${pkgs.rsync}/bin/rsync -avz --chmod=D2755,F744 ${./themes}/ ${config.xdg.dataHome}/themes/
  '';

  home.activation.installFonts = lib.hm.dag.entryAfter ["writeBoundary"] ''
    ${pkgs.rsync}/bin/rsync -avz --chmod=D2755,F744 ${./fonts}/ ${config.xdg.dataHome}/fonts/
  '';

  home.activation.installDict = lib.hm.dag.entryAfter ["writeBoundary"] ''
    ${pkgs.rsync}/bin/rsync -avz --chmod=D2755,F744 ${./stardict}/ ${config.xdg.dataHome}/stardict/
  '';

  home.activation.installWallpapers = lib.hm.dag.entryAfter ["writeBoundary"] ''
    ${pkgs.rsync}/bin/rsync -avz --chmod=D2755,F744 ${./wallpapers}/ ${config.xdg.dataHome}/wallpapers/
  '';
  programs = {
    wezterm = {
      enable = true;
      enableZshIntegration = true;
      enableBashIntegration = true;
      extraConfig = lib.mkDefault (builtins.readFile ./wezterm/wezterm.lua);
    };
    firefox = {
      enable = true;
      profiles.betterfox = {
        extraConfig = builtins.readFile ./user.js;
        #search.default = "Kagi";
        #search.engines = {
        #  "Nix Packages" = {
        #    urls = [
        #      {
        #        template = "https://search.nixos.org/packages";
        #        params = [
        #          {
        #            name = "type";
        #            value = "packages";
        #          }
        #          {
        #            name = "query";
        #            value = "{searchTerms}";
        #          }
        #        ];
        #      }
        #    ];

        #    icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
        #    definedAliases = ["@np"];
        #  };

        #  "NixOS Wiki" = {
        #    urls = [{template = "https://wiki.nixos.org/index.php?search={searchTerms}";}];
        #    iconUpdateURL = "https://wiki.nixos.org/favicon.png";
        #    #updateInterval = 24 * 60 * 60 * 1000; # every day
        #    definedAliases = ["@nw"];
        #  };

        #  "Kagi" = {
        #    urls = [{template = "https://kagi.com/search?q={searchTerms}";}];
        #    definedAliases = ["@kg"];
        #  };
        #};
      };
      package = pkgs.firefox-wayland;
    };
    zathura = {
      enable = true;
      extraConfig = builtins.readFile ./zathurarc;
    };
  };
}
