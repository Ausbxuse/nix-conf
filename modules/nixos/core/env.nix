{...}: {
  environment.sessionVariables = rec {
    XDG_CACHE_HOME = "$HOME/.cache";
    XDG_CONFIG_HOME = "$HOME/.config";
    XDG_DATA_HOME = "$HOME/.local/share";
    XDG_STATE_HOME = "$HOME/.local/state";
    XDG_BIN_HOME = "$HOME/.local/bin";
    PATH = [
      "${XDG_BIN_HOME}"
      "${XDG_BIN_HOME}/scripts"
      "${XDG_BIN_HOME}/scripts/statusbar"
    ];
    EDITOR = "nvim";

    XCURSOR_THEME = "capitaine-cursors-white";
    NPM_PACKAGES = "$HOME/.local/share/npm";
    ZK_NOTEBOOK_DIR = "$HOME/Documents/Notes";
    GTK2_RC_FILES = "${XDG_CONFIG_HOME}/gtk-2.0/gtkrc-2.0";
    LESSHISTFILE = "-";
    WGETRC = "${XDG_CONFIG_HOME}/wget/wgetrc";
    INPUTRC = "${XDG_CONFIG_HOME}/shell/inputrc";
    ZDOTDIR = "${XDG_CONFIG_HOME}/zsh";
    WINEPREFIX = "${XDG_DATA_HOME}/wineprefixes/default";
    PASSWORD_STORE_DIR = "${XDG_DATA_HOME}/password-store";
    ANDROID_SDK_HOME = "${XDG_CONFIG_HOME}/android";
    ANDROID_SDK = "${XDG_CONFIG_HOME}/android/Android/Sdk";
    ANDROID_AVD_HOME = "${XDG_DATA_HOME}/android/";
    ANDROID_EMULATOR_HOME = "${XDG_DATA_HOME}/android/";
    ADB_VENDOR_KEY = "${XDG_CONFIG_HOME}/android";
    CARGO_HOME = "${XDG_DATA_HOME}/cargo";
    GOPATH = "${XDG_DATA_HOME}/go";
    ANSIBLE_CONFIG = "${XDG_CONFIG_HOME}/ansible/ansible.cfg";
    UNISON = "${XDG_DATA_HOME}/unison";
    HISTFILE = "${XDG_DATA_HOME}/history";
    SQLITE_HISTORY = "${XDG_DATA_HOME}/sqlite_history";
    NPM_CONFIG_USERCONFIG = "${XDG_CONFIG_HOME}/npm/npmrc";
    PYLINTHOME = "${XDG_DATA_HOME}/pylint";
    RUSTUP_HOME = "${XDG_DATA_HOME}/rustup";
    CONDARC = "${XDG_CONFIG_HOME}/conda/condarc";
    DICS = "/usr/share/stardict/dic/";
    MUTTER_DEBUG = "color";
  };
}
