{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./common.nix
    ./alacritty.nix
  ];

  home.sessionVariables = {
    XCURSOR_THEME = "capitaine-cursors-white";
    FLAKE = "/home/zhenyu/.local/src/public/nixos-conf";
  };

  home.file.".gdbinit".text = ''
    set auto-load safe-path /nix/store
  '';

  home.activation.installScripts = lib.hm.dag.entryAfter ["writeBoundary"] ''
    ${pkgs.rsync}/bin/rsync -avz --chmod=D2755,F744 ${./bin}/ ${config.home.homeDirectory}/.local/bin/
  '';

  home.activation.installAutostart = lib.hm.dag.entryAfter ["writeBoundary"] ''
    ${pkgs.rsync}/bin/rsync -avz --chmod=D2755,F744 ${./autostart}/ ${config.xdg.configHome}/autostart/
  '';

  home.activation.installTmux = lib.hm.dag.entryAfter ["writeBoundary"] ''
    ${pkgs.rsync}/bin/rsync -avz --chmod=D2755,F744 ${./tmux}/ ${config.xdg.configHome}/tmux/
  '';

  home.activation.installZsh = lib.hm.dag.entryAfter ["writeBoundary"] ''
    ${pkgs.rsync}/bin/rsync -avz --chmod=D2755,F744 ${./zsh}/ ${config.xdg.configHome}/zsh/
  '';

  # programs.zsh = {
  #   dotDir = ".config/zsh";
  #   enable = true;
  #   enableCompletion = true;
  #   autosuggestion.enable = true;
  #   syntaxHighlighting.enable = true;

  #   shellAliases = {
  #     ll = "ls -l";
  #   };
  #   history.size = 10000;
  #   history.path = "${config.xdg.dataHome}/zsh/history";
  # };

  # programs.fzf = {
  #   enable = true;
  #   enableZshIntegration = true;
  # };

  # XDG
  home.activation.installApplications = lib.hm.dag.entryAfter ["writeBoundary"] ''
    ${pkgs.rsync}/bin/rsync -avz --chmod=D2755,F744 ${./applications}/ ${config.xdg.dataHome}/applications/
  '';

  home.activation.installShell = lib.hm.dag.entryAfter ["writeBoundary"] ''
    ${pkgs.rsync}/bin/rsync -avz --chmod=D2755,F744 ${./shell}/ ${config.xdg.configHome}/shell/
  '';

  home.activation.installNvim = lib.hm.dag.entryAfter ["writeBoundary"] ''
    ${pkgs.rsync}/bin/rsync -avz --chmod=D2755,F744 ${./nvim}/ ${config.xdg.configHome}/nvim/
  '';

  programs = {
    neovim = {
      enable = true;
      defaultEditor = true;
      viAlias = true;
      vimAlias = true;
      plugins = [
        pkgs.vimPlugins.markdown-preview-nvim
      ];
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
