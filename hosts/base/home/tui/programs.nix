{
  config,
  lib,
  pkgs,
  user-fullname,
  user-email,
  ...
}: {
  home.packages = with pkgs; [
    fortune
    xdg-utils # provides cli tools such as `xdg-mime` `xdg-open`
    #xdg-user-dirs

    tree-sitter
    fd
    trash-cli
    gh
    tree
    ueberzugpp
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
    btop
    #texlive.combined.scheme-full
  ];

  programs = {
    fzf = {
      enable = true;
      enableZshIntegration = true;
      fileWidgetCommand = "fd --exclude .git -H --max-depth 10 -t f -t l";
      changeDirWidgetCommand = "fd --exclude .git -H --max-depth 12 -t d";
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
          linemode = "mtime";
          show_symlink = true;
          scrolloff = 5;
          sort_sensitive = true;
          show_hidden = true;
          sort_by = "modified";
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
    };

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

    tmux.enable = true;
    zsh = {
      enable = true;
      dotDir = ".config/zsh";
      shellAliases = {
        ll = "ls -l";
        cp = "cp -iv";
        mv = "mv -i";
        rm = "trash-put";
        mkd = "mkdir -pv";
        yt = "youtube-dl --add-metadata -i";
        yta = "yt -x -f bestaudio/best";
        ffmpeg = "ffmpeg -hide_banner";
        # ls="eza --long --git --color=always --no-filesize --icons=always --no-user --no-time --no-permissions --sort=date" ;
        l = "eza --git --color=always --no-filesize --icons=always --no-user --no-time --no-permissions --sort=date";
        ls = "eza --long --git --color=always --icons=always --sort=date";
        grep = "grep --color=auto";
        diff = "diff --color=auto";
        ccat = "highlight --out-format=ansi";
        s = "sdcv -c -u 'WordNet® 3.0 (En-En)'";
        ka = "killall";
        se = "sudoedit";
        ga = "git commit -a";
        trem = "transmission-remote";
        YT = "youtube-viewer";
        sdn = "sudo shutdown -h now";
        f = "$FILE";
        e = "$EDITOR";
        v = "$EDITOR";
        R = "R -q";
        p = "sudo pacman";
        kai = "xdg-open";
        magit = "nvim -c MagitOnly";
        #ref="shortcuts >/dev/null; source ${config.xdg.configHome}/shortcutrc ; source ${config.xdg.configHome}/zshnameddirrc" ;
        weath = "less -S ${config.xdg.dataHome}/weatherreport";
        tmux = "tmux -f ${config.xdg.configHome}/tmux/tmux.conf attach -t main || tmux -f ${config.xdg.configHome}/tmux/tmux.conf new-session -s main";
        yarn = "yarn --use-yarnrc $XDG_CONFIG_HOME/yarn/config";
        lf = "yazi";
        cf = "cd $HOME/.config && ls -a";
        D = "cd $HOME/Downloads && ls -a";
        d = "cd $HOME/Documents && ls -a";
        dt = "cd $HOME/.local/share && ls -a";
        h = "cd $HOME && ls -a";
        m = "cd $HOME/Music && ls -a";
        mn = "cd /mnt && ls -a";
        pp = "cd $HOME/Pictures && ls -a";
        usc = "cd $HOME/Documents/USC";
        sc = "cd $HOME/.local/bin && ls -a";
        src = "cd $HOME/.local/src/public && ls -a";
        vv = "cd $HOME/Videos && ls -a";
        bf = "$EDITOR $HOME/.config/shell/bm-files";
        bd = "$EDITOR $HOME/.config/shell/bm-dirs";
        cfx = "$EDITOR $HOME/.config/x11/xresources";
        cfv = "$EDITOR $HOME/.config/nvim/init.lua";
        cfz = "$EDITOR $HOME/.config/zsh/.zshrc";
        cfa = "$EDITOR $HOME/.config/shell/aliasrc";
        cfp = "$EDITOR $HOME/.config/shell/profile";
        cfmb = "$EDITOR $HOME/.config/ncmpcpp/bindings";
        cfmc = "$EDITOR $HOME/.config/ncmpcpp/config";
        cfl = "$EDITOR $HOME/.config/lf/lfrc";
        cfL = "$EDITOR $HOME/.config/lf/scope";
        cfX = "$EDITOR $HOME/.config/sxiv/exec/key-handler";
      };
      history.size = 10000000;
      history.save = 10000000;
      history.path = "${config.xdg.cacheHome}/zsh/history";
      history.extended = true;
      autocd = true;
      defaultKeymap = "viins";
      completionInit = ''
        autoload -U compinit
        zstyle ':completion:*' matcher-list "" 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
        zmodload zsh/complist
        compinit
        _comp_options+=(globdots)		# Include hidden files.
        export KEYTIMEOUT=1
      '';

      initExtra = builtins.readFile ./zshrc;
      profileExtra = ''

        if [ -e ~/.nix-profile/etc/profile.d/nix.sh ]; then
            . ~/.nix-profile/etc/profile.d/nix.sh
        elif [ -e /etc/profile.d/nix.sh ]; then
            . /etc/profile.d/nix.sh
        fi
      '';
      # source ~/.nix-profile/etc/profile.d/nix.sh
    };
  };

  home.activation.installNvim = lib.hm.dag.entryAfter ["writeBoundary"] ''
    ${pkgs.rsync}/bin/rsync -avz --chmod=D2755,F744 ${./nvim}/ ${config.xdg.configHome}/nvim/
  '';

  # installs zsh plugins
  home.activation.installZshPlugins = lib.hm.dag.entryAfter ["writeBoundary"] ''
    ${pkgs.rsync}/bin/rsync -avz --chmod=D2755,F744 ${./zsh}/ ${config.xdg.configHome}/zsh/
  '';

  home.activation.installTmux = lib.hm.dag.entryAfter ["writeBoundary"] ''
    ${pkgs.rsync}/bin/rsync -avz --chmod=D2755,F744 ${./tmux}/ ${config.xdg.configHome}/tmux/
  '';
}
