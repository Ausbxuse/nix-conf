{
  lib,
  pkgs,
  config,
  user-fullname,
  user-email,
  ...
}: {
  home.packages = with pkgs; [
    xdg-utils # provides cli tools such as `xdg-mime` `xdg-open`
    xdg-user-dirs

    tree-sitter
    fd
    trash-cli
    gh
    tree
    ueberzugpp
    #ltex-ls
    #clang-tools
    marksman
    #nodePackages.pyright
    bat
    nyancat
    #gnumake
    pre-commit
    cowsay
    file
    jdk
    cargo
    nodejs
    gcc
    htop
    gnupg
    iftop
    neofetch
    nix-output-monitor
    shfmt
    nmap
    #nodePackages.npm
    #nodePackages.pnpm
    ripgrep
    strace # system call monitoring
    tree
    unzip
    xz
    yarn
    zip
    home-manager
    alejandra
    #nh
    #nvd
    gdb
    eza

    #texlive.combined.scheme-full
  ];

  programs = {
    fzf = {
      enable = true;
      enableZshIntegration = true;
      fileWidgetCommand = "fd -H --max-depth 10 -t f -t l";
      changeDirWidgetCommand = "fd -H --max-depth 12 -t d";
    };

    zoxide = {
      enable = true;
      enableZshIntegration = true;
    };

    yazi = {
      enable = true;
      enableZshIntegration = true;
      settings = {
        log = {
          enabled = false;
        };
        manager = {
          linemode = "size";
          show_symlink = true;
          scrolloff = 5;
          sort_sensitive = true;
          show_hidden = true;
          sort_by = "size";
          sort_dir_first = true;
          sort_reverse = true;
        };
      };
    };

    neovim = {
      enable = true;
      defaultEditor = true;
      viAlias = true;
      vimAlias = true;
      extraWrapperArgs = with pkgs; [
        # LIBRARY_PATH is used by gcc before compilation to search directories
        # containing static and shared libraries that need to be linked to your program.
        "--suffix"
        "LIBRARY_PATH"
        ":"
        "${lib.makeLibraryPath [stdenv.cc.cc zlib]}"

        # PKG_CONFIG_PATH is used by pkg-config before compilation to search directories
        # containing .pc files that describe the libraries that need to be linked to your program.
        "--suffix"
        "PKG_CONFIG_PATH"
        ":"
        "${lib.makeSearchPathOutput "dev" "lib/pkgconfig" [stdenv.cc.cc zlib]}"
      ];
      #plugins =with pkgs.vimPlugins; [
      #  markdown-preview-nvim
      #telescope-fzf-native-nvim

      # nvim-treesitter.withAllGrammars
      #];
    };

    btop.enable = true; # replacement of htop/nmon
    #eza.enable = true; # A modern replacement for ‘ls’
    git = {
      enable = true;

      userName = "${user-fullname}";
      userEmail = "${user-email}";
      delta = {
        enable = true;
        options = {
          # decorations = {
          #   commit-decoration-style = "bold yellow box ul";
          #   file-decoration-style = "none";
          #   file-style = "bold yellow ul";
          # };
          side-by-side = true;
          features = "decorations";
          whitespace-error-style = "22 reverse";
        };
      };
    };
  };

  xdg = {
    enable = true;
    cacheHome = "${config.home.homeDirectory}/.cache";
    configHome = "${config.home.homeDirectory}/.config";
    dataHome = "${config.home.homeDirectory}/.local/share";
    stateHome = "${config.home.homeDirectory}/.local/state";
  };

  home.sessionVariables = {
    XCURSOR_THEME = "capitaine-cursors-white";
    FLAKE = "${config.home.homeDirectory}/.local/src/public/nixos-conf";
    MANPAGER = "nvim +Man!";
    NPM_PACKAGES = "''${config.home.homeDirectory}/.local/share/npm";
    NODE_PATH = "$NPM_PACKAGES/lib/node_modules:$NODE_PATH";
    PATH = "$PATH:$(du ${config.home.homeDirectory}/.local/bin/ | cut -f2 | paste -sd ':')";
    ZK_NOTEBOOK_DIR = "''${config.home.homeDirectory}/Documents/Notes";
    NOTMUCH_CONFIG = "${config.xdg.configHome}/notmuch-config";
    WGETRC = "${config.xdg.configHome}/wget/wgetrc";
    INPUTRC = "${config.xdg.configHome}/shell/inputrc";
    PASSWORD_STORE_DIR = "${config.xdg.dataHome}/password-store";
    #TMUX_TMPDIR = "$XDG_RUNTIME_DIR";
    CARGO_HOME = "${config.xdg.dataHome}/cargo";
    GOPATH = "${config.xdg.dataHome}/go";
    ANSIBLE_CONFIG = "${config.xdg.configHome}/ansible/ansible.cfg";
    HISTFILE = "${config.xdg.dataHome}/history";
    SQLITE_HISTORY = "${config.xdg.dataHome}/sqlite_history";
    NPM_CONFIG_USERCONFIG = "${config.xdg.configHome}/npm/npmrc";
    PYLINTHOME = "${config.xdg.dataHome}/pylint";
    RUSTUP_HOME = "${config.xdg.dataHome}/rustup";
    CONDARC = "${config.xdg.configHome}/conda/condarc";
    DICS = "${config.xdg.dataHome}/stardict/dic/";
    LC_ALL = "en_US.UTF-8";
    LANGUAGE = "en_US.UTF-8";
  };

  home.file.".gdbinit".text = ''
    set auto-load safe-path /nix/store
  '';

  home.activation.installScripts = lib.hm.dag.entryAfter ["writeBoundary"] ''
    ${pkgs.rsync}/bin/rsync -avz --chmod=D2755,F744 ${./bin}/ ${config.home.homeDirectory}/.local/bin/
  '';

  home.activation.installNvim = lib.hm.dag.entryAfter ["writeBoundary"] ''
    ${pkgs.rsync}/bin/rsync -avz --chmod=D2755,F744 ${./nvim}/ ${config.xdg.configHome}/nvim/
  '';

  # installs zsh plugins
  home.activation.installZshPlugins = lib.hm.dag.entryAfter ["writeBoundary"] ''
    ${pkgs.rsync}/bin/rsync -avz --chmod=D2755,F744 ${./zsh-config/zsh}/ ${config.xdg.configHome}/zsh/
  '';
}
