# XDG stands for "Cross-Desktop Group", with X used to mean "cross".
# It's a bunch of specifications from freedesktop.org intended to standardize desktops and
# other GUI applications on various systems (primarily Unix-like) to be interoperable:
#   https://www.freedesktop.org/wiki/Specifications/
{
  config,
  pkgs,
  ...
}: {
  xdg = {
    configFile."mimeapps.list".force = true;
    # manage $XDG_CONFIG_HOME/mimeapps.list
    # xdg search all desktop entries from $XDG_DATA_DIRS, check it by command:
    #  echo $XDG_DATA_DIRS
    # the system-level desktop entries can be list by command:
    #   ls -l /run/current-system/sw/share/applications/
    # the user-level desktop entries can be list by command:
    #  ls /etc/profiles/per-user/$USER/share/applications/
    mimeApps = {
      enable = true;
      defaultApplications = let
        browser = ["firefox.desktop"];
        editor = ["text.desktop"];
        pdfviewer = ["pdf.desktop"];
        office = ["libreoffice-writer.desktop"];
      in {
        "application/json" = browser;
        "application/pdf" = pdfviewer;

        "text/html" = browser;
        "text/xml" = browser;
        "text/plain" = editor;
        "application/vnd.openxmlformats-officedocument.wordprocessingml.document" = browser;
        "application/xml" = browser;
        "application/xhtml+xml" = browser;
        "application/xhtml_xml" = browser;
        "application/rdf+xml" = browser;
        "application/rss+xml" = browser;
        "application/x-extension-htm" = browser;
        "application/x-extension-html" = browser;
        "application/x-extension-shtml" = browser;
        "application/x-extension-xht" = browser;
        "application/x-extension-xhtml" = browser;
        "application/x-wine-extension-ini" = editor;

        # define default applications for some url schemes.
        "x-scheme-handler/about" = browser; # open `about:` url with `browser`
        "x-scheme-handler/ftp" = browser; # open `ftp:` url with `browser`
        "x-scheme-handler/http" = browser;
        "x-scheme-handler/https" = browser;
        # https://github.com/microsoft/vscode/issues/146408
        "x-scheme-handler/vscode" = ["code-url-handler.desktop"]; # open `vscode://` url with `code-url-handler.desktop`
        "x-scheme-handler/vscode-insiders" = ["code-insiders-url-handler.desktop"]; # open `vscode-insiders://` url with `code-insiders-url-handler.desktop`
        # all other unknown schemes will be opened by this default application.
        # "x-scheme-handler/unknown" = editor;

        "x-scheme-handler/discord" = ["discord.desktop"];
        "x-scheme-handler/tg" = ["org.telegram.desktop.desktop "];

        "audio/*" = ["mpv.desktop"];
        "video/*" = ["mpv.desktop"];
        "image/*" = ["imv-dir.desktop"];
        "image/gif" = ["imv-dir.desktop"];
        "image/jpeg" = ["imv-dir.desktop"];
        "image/png" = ["imv-dir.desktop"];
        "image/webp" = ["imv-dir.desktop"];
      };

      associations.removed = {
        # ......
      };
    };

    configFile."user-dirs.dirs".force = true;
    userDirs = {
      enable = true;
      createDirectories = false;
      pictures = "${config.home.homeDirectory}/Media/Pictures";
      videos = "${config.home.homeDirectory}/Media/Videos";
      music = "${config.home.homeDirectory}/Media/Music";
      publicShare = "${config.home.homeDirectory}/Public";
      extraConfig = {
        XDG_SCREENSHOTS_DIR = "${config.xdg.userDirs.pictures}/Screenshots";
      };
    };
  };

  # xdg.portal = {
  #   enable = true;
  #   extraPortals = [
  #     pkgs.xdg-desktop-portal-gtk
  #     # pkgs.xdg-desktop-portal-hyprland
  #   ];
  # };
}
