{
  lib,
  pkgs,
  config,
  ...
}: {
  programs.zsh = {
    dotDir = ".config/zsh";
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = false;
    syntaxHighlighting.enable = false;
    syntaxHighlighting.styles = {
      path = "fg=magenta,bold";
    };
    historySubstringSearch.enable = false;

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
      # These common commands are just too long! Abbreviate them.
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

    #profileExtra = ''
    #  source ~/.nix-profile/etc/profile.d/nix.sh
    #'';
  };
}
