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
      extraConfig = builtins.readFile ./wezterm/wezterm.lua;
    };
    firefox = {
      enable = true;
      profiles.betterfox.extraConfig = builtins.readFile ./user.js;
    };
    zathura = {
      enable = true;
      extraConfig = ''
        set font			"BreezeSans Regular 12"
        #set recolor                     true
        #set completion-group-bg         "#002b36"
        #set completion-group-fg         "#839496"
        #set completion-bg               "#073642"
        #set completion-fg               "#93a1a1"
        #set completion-highlight-bg     "#586e75"
        #set completion-highlight-fg     "#eee8d5"
        #set notification-error-bg       "#074D40"
        #set notification-error-fg       "#E5E5E5"
        #set notification-warning-bg     "#074D40"
        #set notification-warning-fg     "#E5E5E5"
        #set notification-bg             "#074D40"
        #set notification-fg             "#b58900"
        #set index-bg                    "#26354b"
        #set index-fg                    "#E5E5E5"
        #set index-active-bg             "#586e75"
        #set index-active-fg             "#eee8d5"
        set inputbar-bg                 "#282c34"
        set inputbar-fg                 "#E5E5E5"
        set statusbar-bg                "#282c34"
        set statusbar-fg                "#f9f9f9"
        set highlight-color             "#268bd2"
        set highlight-active-color      "#074D40"
        set default-bg                  "#282c34"
        set default-fg                  "#111111"
        set recolor-lightcolor          "#111111"
        set recolor-darkcolor           "#E5E5E5"
        set statusbar-v-padding  	3
        set statusbar-h-padding  	75
        set pages-per-row 		1
        set statusbar-basename          true
        set page-padding 		1
        set adjust_window		width
        # Annotate in zathura settings
        set selection-clipboard clipboard

        # mappings
        map u scroll half-up
        map d scroll half-down
        map D toggle_page_mode
        map r reload
        map R rotate
        map K zoom in
        map J zoom out
        map i recolor
        map p print
        map [normal] b toggle_statusbar
      '';
    };
  };
}
