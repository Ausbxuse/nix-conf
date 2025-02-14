{
  config,
  lib,
  pkgs,
  username,
  ...
}: {
  home = {
    username = "${username}";
    homeDirectory = "${config.home.homeDirectory}";
    stateVersion = "24.05";
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
    FLAKE = "${config.home.homeDirectory}/src/public/nixos-conf";
    MANPAGER = "nvim +Man!";
    NPM_PACKAGES = "${config.home.homeDirectory}/.local/share/npm";
    NODE_PATH = "$NPM_PACKAGES/lib/node_modules:$NODE_PATH";
    PATH = "$PATH:$(du ${config.home.homeDirectory}/.local/bin/ | cut -f2 | paste -sd ':')";
    ZK_NOTEBOOK_DIR = "${config.home.homeDirectory}/Documents/Notes";
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
}
