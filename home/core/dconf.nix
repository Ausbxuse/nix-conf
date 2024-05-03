# Generated via dconf2nix: https://github.com/gvolpe/dconf2nix
{lib, ...}:
with lib.hm.gvariant; {
  dconf.settings = {
    "ca/desrt/dconf-editor" = {
      saved-pathbar-path = "/org/gtk/Demo/";
      saved-view = "/org/";
      show-warning = false;
      window-height = 1001;
      window-is-maximized = false;
      window-width = 1920;
    };

    "com/mattjakeman/ExtensionManager" = {
      last-used-version = "0.4.3";
    };

    "org/freedesktop/folks" = {
      primary-store = "eds:5270dfa1c531c0716c97f05278c1491b1757dc68";
    };

    "org/freedesktop/tracker/miner/files" = {
      index-recursive-directories = ["&DESKTOP" "&DOCUMENTS" "&MUSIC" "&PICTURES" "&VIDEOS" "/home/zhenyu/Music"];
    };

    "org/gnome/Console" = {
      last-window-size = mkTuple [708 852];
      use-system-font = true;
    };

    "org/gnome/Contacts" = {
      did-initial-setup = true;
      window-fullscreen = false;
      window-height = 1048;
      window-maximized = false;
      window-width = 1920;
    };

    "org/gnome/GWeather4" = {
      temperature-unit = "centigrade";
    };

    "org/gnome/Geary" = {
      compose-as-html = true;
      formatting-toolbar-visible = false;
      migrated-config = true;
      window-height = 1048;
      window-maximize = false;
      window-width = 1920;
    };

    "org/gnome/Music" = {
      window-maximized = false;
      window-size = [1440 868];
    };

    "org/gnome/Snapshot" = {
      is-maximized = false;
      window-height = 852;
      window-width = 708;
    };

    "org/gnome/Totem" = {
      active-plugins = ["skipto" "variable-rate" "apple-trailers" "open-directory" "rotation" "save-file" "screensaver" "vimeo" "screenshot" "mpris" "movie-properties" "autoload-subtitles" "recent"];
      subtitle-encoding = "UTF-8";
    };

    "org/gnome/Weather" = {
      locations = [(mkVariant [(mkUint32 2) (mkVariant ["Los Angeles" "KCQT" true [(mkTuple [0.5937028397045019 (-2.064433611082862)])] [(mkTuple [0.5943236009595587 (-2.063741622941031)])]])])];
      window-height = 852;
      window-maximized = false;
      window-width = 708;
    };

    "org/gnome/baobab/ui" = {
      is-maximized = false;
      window-size = mkTuple [1440 868];
    };

    "org/gnome/calculator" = {
      accuracy = 9;
      angle-units = "degrees";
      base = 10;
      button-mode = "advanced";
      number-format = "automatic";
      show-thousands = false;
      show-zeroes = false;
      source-currency = "";
      source-units = "degree";
      target-currency = "";
      target-units = "radian";
      window-maximized = false;
      window-size = mkTuple [680 659];
      word-size = 64;
    };

    "org/gnome/calendar" = {
      active-view = "month";
      window-maximized = false;
      window-size = mkTuple [948 1032];
    };

    "org/gnome/cheese" = {
      burst-delay = 1000;
      camera = "USB2.0 FHD UVC WebCam (V4L2)";
      photo-x-resolution = 1920;
      photo-y-resolution = 1080;
      selected-effect = "No Effect";
      video-x-resolution = 1920;
      video-y-resolution = 1080;
    };

    "org/gnome/clocks" = {
      world-clocks = [
        {
          location = mkVariant [(mkUint32 2) (mkVariant ["Wuhan" "ZHHH" true [(mkTuple [0.5343616451366947 1.9920024471250972])] [(mkTuple [0.5337798570838349 1.9943295644299512])]])];
        }
      ];
    };

    "org/gnome/clocks/state/window" = {
      maximized = false;
      panel-id = "world";
      size = mkTuple [1440 868];
    };

    "org/gnome/control-center" = {
      last-panel = "keyboard";
      window-state = mkTuple [948 1032 false];
    };

    "org/gnome/desktop/a11y/applications" = {
      screen-keyboard-enabled = false;
      screen-magnifier-enabled = false;
      screen-reader-enabled = false;
    };

    "org/gnome/desktop/a11y/keyboard" = {
      stickykeys-enable = false;
    };

    "org/gnome/desktop/a11y/magnifier" = {
      mag-factor = 1.0;
    };

    "org/gnome/desktop/app-folders" = {
      folder-children = ["Utilities" "YaST" "Pardus"];
    };

    "org/gnome/desktop/app-folders/folders/Pardus" = {
      categories = ["X-Pardus-Apps"];
      name = "X-Pardus-Apps.directory";
      translate = true;
    };

    "org/gnome/desktop/app-folders/folders/Utilities" = {
      apps = ["gnome-abrt.desktop" "gnome-system-log.desktop" "nm-connection-editor.desktop" "org.gnome.baobab.desktop" "org.gnome.Connections.desktop" "org.gnome.DejaDup.desktop" "org.gnome.Dictionary.desktop" "org.gnome.DiskUtility.desktop" "org.gnome.Evince.desktop" "org.gnome.FileRoller.desktop" "org.gnome.fonts.desktop" "org.gnome.Loupe.desktop" "org.gnome.seahorse.Application.desktop" "org.gnome.tweaks.desktop" "org.gnome.Usage.desktop" "vinagre.desktop"];
      categories = ["X-GNOME-Utilities"];
      name = "X-GNOME-Utilities.directory";
      translate = true;
    };

    "org/gnome/desktop/app-folders/folders/YaST" = {
      categories = ["X-SuSE-YaST"];
      name = "suse-yast.directory";
      translate = true;
    };

    "org/gnome/desktop/background" = {
      color-shading-type = "solid";
      picture-options = "zoom";
      picture-uri = "file:///home/zhenyu/.local/share/backgrounds/2024-04-29-22-53-06-1310342.jpg";
      picture-uri-dark = "file:///home/zhenyu/.local/share/backgrounds/2024-04-29-22-53-06-1310342.jpg";
      primary-color = "#000000000000";
      secondary-color = "#000000000000";
    };

    "org/gnome/desktop/calendar" = {
      show-weekdate = false;
    };

    "org/gnome/desktop/datetime" = {
      automatic-timezone = true;
    };

    "org/gnome/desktop/file-sharing" = {
      require-password = "always";
    };

    "org/gnome/desktop/input-sources" = {
      mru-sources = [(mkTuple ["xkb" "us"])];
      sources = [(mkTuple ["xkb" "us"])];
      xkb-options = ["terminate:ctrl_alt_bksp" "caps:escape"];
    };

    "org/gnome/desktop/interface" = {
      clock-show-seconds = false;
      clock-show-weekday = true;
      color-scheme = "prefer-dark";
      cursor-blink = false;
      cursor-size = 24;
      cursor-theme = "capitaine-cursors-white";
      enable-animations = true;
      enable-hot-corners = false;
      font-antialiasing = "grayscale";
      font-hinting = "slight";
      font-name = "Noto Sans,  10";
      icon-theme = "Adwaita";
      locate-pointer = false;
      scaling-factor = mkUint32 1;
      show-battery-percentage = false;
      text-scaling-factor = 1.0;
      toolbar-style = "text";
      toolkit-accessibility = false;
    };

    "org/gnome/desktop/notifications" = {
      application-children = ["org-gnome-fontmanager" "org-gnome-settings" "alacritty" "firefox" "gnome-power-panel" "org-kde-kdeconnect-daemon" "org-gnome-characters" "org-gnome-tweaks" "discord" "org-gnome-shell-extensions-gsconnect" "org-pwmt-zathura" "org-gnome-console" "steam" "calibre-ebook-edit"];
      show-banners = true;
    };

    "org/gnome/desktop/notifications/application/alacritty" = {
      application-id = "Alacritty.desktop";
    };

    "org/gnome/desktop/notifications/application/calibre-ebook-edit" = {
      application-id = "calibre-ebook-edit.desktop";
    };

    "org/gnome/desktop/notifications/application/discord" = {
      application-id = "discord.desktop";
    };

    "org/gnome/desktop/notifications/application/firefox" = {
      application-id = "firefox.desktop";
    };

    "org/gnome/desktop/notifications/application/gnome-power-panel" = {
      application-id = "gnome-power-panel.desktop";
    };

    "org/gnome/desktop/notifications/application/mpv" = {
      application-id = "mpv.desktop";
    };

    "org/gnome/desktop/notifications/application/org-gnome-baobab" = {
      application-id = "org.gnome.baobab.desktop";
    };

    "org/gnome/desktop/notifications/application/org-gnome-characters" = {
      application-id = "org.gnome.Characters.desktop";
    };

    "org/gnome/desktop/notifications/application/org-gnome-console" = {
      application-id = "org.gnome.Console.desktop";
    };

    "org/gnome/desktop/notifications/application/org-gnome-fontmanager" = {
      application-id = "org.gnome.FontManager.desktop";
    };

    "org/gnome/desktop/notifications/application/org-gnome-nautilus" = {
      application-id = "org.gnome.Nautilus.desktop";
    };

    "org/gnome/desktop/notifications/application/org-gnome-settings" = {
      application-id = "org.gnome.Settings.desktop";
    };

    "org/gnome/desktop/notifications/application/org-gnome-shell-extensions-gsconnect" = {
      application-id = "org.gnome.Shell.Extensions.GSConnect.desktop";
    };

    "org/gnome/desktop/notifications/application/org-gnome-tweaks" = {
      application-id = "org.gnome.tweaks.desktop";
    };

    "org/gnome/desktop/notifications/application/org-kde-kdeconnect-daemon" = {
      application-id = "org.kde.kdeconnect.daemon.desktop";
    };

    "org/gnome/desktop/notifications/application/org-pwmt-zathura" = {
      application-id = "org.pwmt.zathura.desktop";
    };

    "org/gnome/desktop/notifications/application/steam" = {
      application-id = "steam.desktop";
    };

    "org/gnome/desktop/notifications/application/sxiv" = {
      application-id = "sxiv.desktop";
    };

    "org/gnome/desktop/peripherals/keyboard" = {
      delay = mkUint32 158;
      repeat-interval = mkUint32 30;
    };

    "org/gnome/desktop/peripherals/mouse" = {
      accel-profile = "flat";
      left-handed = false;
      natural-scroll = false;
      speed = 0.0;
    };

    "org/gnome/desktop/peripherals/tablets/04f3:425a" = {
      output = ["SDC" "0x419d" "0x00000000" "eDP-2"];
    };

    "org/gnome/desktop/peripherals/tablets/04f3:425b" = {
      output = ["SDC" "0x419d" "0x00000000" "eDP-1"];
    };

    "org/gnome/desktop/peripherals/touchpad" = {
      click-method = "areas";
      edge-scrolling-enabled = false;
      natural-scroll = true;
      tap-to-click = false;
      two-finger-scrolling-enabled = true;
    };

    "org/gnome/desktop/peripherals/touchscreens/04f3:425a" = {
      output = ["SDC" "0x419d" "0x00000000" "eDP-2"];
    };

    "org/gnome/desktop/peripherals/touchscreens/04f3:425b" = {
      output = ["SDC" "0x419d" "0x00000000" "eDP-1"];
    };

    "org/gnome/desktop/privacy" = {
      old-files-age = mkUint32 30;
      recent-files-max-age = -1;
    };

    "org/gnome/desktop/screensaver" = {
      color-shading-type = "solid";
      picture-options = "zoom";
      picture-uri = "file:///home/zhenyu/.local/share/backgrounds/2024-04-29-22-53-06-1310342.jpg";
      primary-color = "#000000000000";
      secondary-color = "#000000000000";
    };

    "org/gnome/desktop/session" = {
      idle-delay = mkUint32 300;
    };

    "org/gnome/desktop/sound" = {
      event-sounds = true;
      theme-name = "__custom";
    };

    "org/gnome/desktop/wm/keybindings" = {
      activate-window-menu = [];
      close = ["<Super>a"];
      cycle-windows = [];
      cycle-windows-backward = [];
      maximize = [];
      minimize = [];
      move-to-monitor-down = ["<Shift><Super>j"];
      move-to-monitor-left = ["<Shift><Super>h"];
      move-to-monitor-right = ["<Shift><Super>l"];
      move-to-monitor-up = ["<Shift><Super>k"];
      move-to-workspace-1 = ["<Shift><Super>q"];
      move-to-workspace-2 = ["<Shift><Super>w"];
      move-to-workspace-3 = ["<Shift><Super>e"];
      move-to-workspace-4 = ["<Shift><Super>r"];
      switch-applications = ["<Super>Tab" "<Alt>Tab"];
      switch-applications-backward = ["<Shift><Super>Tab" "<Shift><Alt>Tab"];
      switch-group = ["<Super>Above_Tab" "<Alt>Above_Tab"];
      switch-group-backward = ["<Shift><Super>Above_Tab" "<Shift><Alt>Above_Tab"];
      switch-input-source = ["<Shift><Control>space"];
      switch-input-source-backward = ["<Control>space"];
      switch-panels = ["<Control><Alt>Tab"];
      switch-panels-backward = ["<Shift><Control><Alt>Tab"];
      switch-to-workspace-1 = ["<Super>q"];
      switch-to-workspace-2 = ["<Super>w"];
      switch-to-workspace-3 = ["<Super>e"];
      switch-to-workspace-4 = ["<Super>r"];
      switch-to-workspace-last = ["<Super>End"];
      switch-to-workspace-left = ["<Super>Page_Up" "<Super><Alt>Left" "<Control><Alt>Left"];
      switch-to-workspace-right = ["<Super>Page_Down" "<Super><Alt>Right" "<Control><Alt>Right"];
      toggle-fullscreen = ["<Super>f"];
      unmaximize = ["<Super>Down" "<Alt>F5"];
    };

    "org/gnome/desktop/wm/preferences" = {
      button-layout = "icon:minimize,maximize,close";
      workspace-names = ["Main" "Workspace 2" "Workspace 3" "Workspace 4"];
    };

    "org/gnome/epiphany" = {
      ask-for-default = false;
    };

    "org/gnome/evolution-data-server" = {
      migrated = true;
    };

    "org/gnome/evolution" = {
      default-address-book = "5270dfa1c531c0716c97f05278c1491b1757dc68";
    };

    "org/gnome/font-manager" = {
      content-pane-position = 106;
    };

    "org/gnome/gnome-system-monitor" = {
      cpu-colors = [(mkTuple [(mkUint32 0) "#e6194B"]) (mkTuple [1 "#f58231"]) (mkTuple [2 "#ffe119"]) (mkTuple [3 "#bfef45"]) (mkTuple [4 "#3cb44b"]) (mkTuple [5 "#42d4f4"]) (mkTuple [6 "#4363d8"]) (mkTuple [7 "#911eb4"]) (mkTuple [8 "#f032e6"]) (mkTuple [9 "#fabebe"]) (mkTuple [10 "#ffd8b1"]) (mkTuple [11 "#fffac8"]) (mkTuple [12 "#aaffc3"]) (mkTuple [13 "#469990"]) (mkTuple [14 "#000075"]) (mkTuple [15 "#e6beff"]) (mkTuple [16 "#f332f01e7999"]) (mkTuple [17 "#cca37999f332"]) (mkTuple [18 "#7999f332a928"]) (mkTuple [19 "#f33285ac7999"]) (mkTuple [20 "#79999100f332"]) (mkTuple [21 "#b47cf3327999"])];
      current-tab = "resources";
      maximized = false;
      network-total-in-bits = false;
      show-dependencies = false;
      show-whose-processes = "user";
      smooth-refresh = true;
      window-state = mkTuple [1440 868 26 23];
    };

    "org/gnome/gnome-system-monitor/disktreenew" = {
      col-6-visible = true;
      col-6-width = 0;
    };

    "org/gnome/maps" = {
      last-viewed-location = [30.615780196912 114.25674940375285];
      map-type = "MapsStreetSource";
      transportation-type = "pedestrian";
      window-maximized = false;
      window-size = [1920 1048];
      zoom-level = 16;
    };

    "org/gnome/mutter" = {
      attach-modal-dialogs = false;
      dynamic-workspaces = false;
      edge-tiling = false;
      overlay-key = "";
      workspaces-only-on-primary = false;
    };

    "org/gnome/mutter/keybindings" = {
      cancel-input-capture = ["<Super><Shift>Escape"];
      toggle-tiled-left = ["<Super>Left"];
      toggle-tiled-right = ["<Super>Right"];
    };

    "org/gnome/mutter/wayland/keybindings" = {
      restore-shortcuts = ["<Super>Escape"];
    };

    "org/gnome/nautilus/preferences" = {
      default-folder-viewer = "icon-view";
      migrated-gtk-settings = true;
      search-filter-time-type = "last_modified";
      show-image-thumbnails = "always";
    };

    "org/gnome/nautilus/window-state" = {
      initial-size = mkTuple [1920 1048];
      maximized = false;
    };

    "org/gnome/nm-applet/eap/47c62d89-850c-4c25-88dc-9da91a6df621" = {
      ignore-ca-cert = false;
      ignore-phase2-ca-cert = false;
    };

    "org/gnome/nm-applet/eap/947be011-d5e3-4e78-a818-cd1851929639" = {
      ignore-ca-cert = true;
      ignore-phase2-ca-cert = false;
    };

    "org/gnome/portal/filechooser/gnome-background-panel" = {
      last-folder-path = "/home/zhenyu/.local/share/wallpapers";
    };

    "org/gnome/settings-daemon/plugins/color" = {
      night-light-enabled = true;
      night-light-last-coordinates = mkTuple [34.04009882783295 (-118.3027466)];
      night-light-schedule-automatic = false;
      night-light-schedule-from = 17.0;
      night-light-schedule-to = 5.0;
      night-light-temperature = mkUint32 3409;
    };

    "org/gnome/settings-daemon/plugins/media-keys" = {
      custom-keybindings = ["/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/" "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/" "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/" "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom3/" "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom4/"];
      logout = ["<Shift><Super>a"];
      magnifier = ["<Super>slash"];
      magnifier-zoom-in = ["<Super>z"];
      magnifier-zoom-out = ["<Shift><Super>z"];
      rfkill-static = ["XF86UWB" "XF86RFKill"];
      rotate-video-lock-static = ["<Super>o" "XF86RotationLockToggle"];
      screenreader = [];
      screensaver = [];
      search = ["<Super>d"];
      volume-down = ["<Super>comma"];
      volume-mute = ["<Super>m"];
      volume-up = ["<Super>period"];
    };

    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
      binding = "<Super>apostrophe";
      command = "gdbus call --session --dest org.gnome.SettingsDaemon.Power --object-path /org/gnome/SettingsDaemon/Power --method org.gnome.SettingsDaemon.Power.Screen.StepUp";
      name = "Bright up";
    };

    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1" = {
      binding = "<Super>semicolon";
      command = "gdbus call --session --dest org.gnome.SettingsDaemon.Power --object-path /org/gnome/SettingsDaemon/Power --method org.gnome.SettingsDaemon.Power.Screen.StepDown";
      name = "Bright down";
    };

    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2" = {
      binding = "<Super>space";
      command = "alacritty";
      name = "Terminal";
    };

    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom3" = {
      binding = "<Super>s";
      command = "firefox";
      name = "Browser";
    };

    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom4" = {
      binding = "WLAN";
      command = "/home/zhenyu/.local/bin/duo toggle";
      name = "Toggle duo screen mode";
    };

    "org/gnome/settings-daemon/plugins/sharing/gnome-user-share-webdav" = {
      enabled-connections = [];
    };

    "org/gnome/shell" = {
      command-history = ["lg"];
      disable-user-extensions = false;
      disabled-extensions = ["light-style@gnome-shell-extensions.gcampax.github.com" "native-window-placement@gnome-shell-extensions.gcampax.github.com" "places-menu@gnome-shell-extensions.gcampax.github.com" "tiling-assistant@leleat-on-github" "Rounded_Corners@lennart-k" "auto-move-windows@gnome-shell-extensions.gcampax.github.com" "window-list@gnome-shell-extensions.gcampax.github.com" "Vitals@CoreCoding.com" "paperwm@paperwm.github.com" "netspeedsimplified@prateekmedia.extension" "apps-menu@gnome-shell-extensions.gcampax.github.com" "cronomix@zagortenay333"];
      enabled-extensions = ["blur-my-shell@aunetx" "screenshot-window-sizer@gnome-shell-extensions.gcampax.github.com" "drive-menu@gnome-shell-extensions.gcampax.github.com" "user-theme@gnome-shell-extensions.gcampax.github.com" "kimpanel@kde.org" "gnomebedtime@ionutbortis.gmail.com" "gsconnect@andyholmes.github.io" "night-light-slider-updated@vilsbeg.codeberg.org" "forge@jmmaranan.com" "CoverflowAltTab@palatis.blogspot.com" "color-picker@tuberry" "caffeine@patapon.info" "Bluetooth-Battery-Meter@maniacx.github.com" "hide-cursor@elcste.com" "just-perfection-desktop@just-perfection" "monitor@astraext.github.io" "workspace-indicator@gnome-shell-extensions.gcampax.github.com" "windowsNavigator@gnome-shell-extensions.gcampax.github.com" "unite@hardpixel.eu" "mediacontrols@cliffniff.github.com" "dash-to-dock@micxgx.gmail.com" "status-area-horizontal-spacing@mathematical.coffee.gmail.com" "system-monitor-next@paradoxxx.zero.gmail.com"];
      favorite-apps = ["org.gnome.Settings.desktop" "org.gnome.Nautilus.desktop" "org.gnome.Extensions.desktop" "org.gnome.Geary.desktop" "gnome-system-monitor.desktop" "org.gnome.Calendar.desktop" "org.gnome.Music.desktop" "firefox.desktop" "Alacritty.desktop" "discord.desktop" "steam.desktop" "obsidian.desktop" "com.github.xournalpp.xournalpp.desktop"];
      looking-glass-history = ["Flags"];
      welcome-dialog-last-shown-version = "45.5";
    };

    "org/gnome/shell/extensions/Bluetooth-Battery-Meter" = {
      enable-battery-level-icon = true;
      enable-battery-level-text = true;
      swap-icon-text = false;
    };

    "org/gnome/shell/extensions/astra-monitor" = {
      gpu-header-activity-bar-color1 = "rgba(29,172,214,1.0)";
      gpu-header-activity-graph-color1 = "rgba(29,172,214,1.0)";
      gpu-indicators-order = "[\"icon\",\"activity bar\",\"activity graph\",\"activity percentage\",\"memory bar\",\"memory graph\",\"memory percentage\",\"memory value\"]";
      headers-font-family = "System-ui";
      headers-font-size = 11;
      headers-height = 28;
      memory-header-show = false;
      memory-indicators-order = "[\"icon\",\"bar\",\"graph\",\"percentage\",\"value\",\"free\"]";
      monitors-order = "[\"sensors\",\"network\",\"processor\",\"gpu\",\"memory\",\"storage\"]";
      network-header-bars = false;
      network-header-graph = false;
      network-header-icon = false;
      network-header-io = true;
      network-header-tooltip = false;
      network-header-tooltip-io = true;
      network-indicators-order = "[\"icon\",\"IO bar\",\"IO speed\",\"IO graph\"]";
      network-update = 2.0000000000000004;
      panel-box-order = 2;
      panel-margin-left = 0;
      processor-header-bars = false;
      processor-header-bars-core = true;
      processor-header-graph = true;
      processor-header-graph-breakdown = true;
      processor-header-graph-width = 29;
      processor-header-icon = false;
      processor-header-percentage = false;
      processor-header-percentage-core = false;
      processor-header-show = false;
      processor-header-tooltip-percentage-core = false;
      processor-indicators-order = "[\"icon\",\"bar\",\"graph\",\"percentage\"]";
      processor-menu-gpu-color = "";
      processor-update = 2.0;
      queued-pref-category = "";
      sensors-header-icon = false;
      sensors-header-sensor1 = ''
        {"service":"hwmon","path":["coretemp","Core 8","input"]}
      '';
      sensors-header-sensor1-digits = -1;
      sensors-header-sensor1-show = true;
      sensors-header-show = true;
      sensors-header-tooltip = false;
      sensors-header-tooltip-sensor1 = ''
        {"service":"hwmon","path":["BAT0","in0","input"]}\\\\\\\\\\\\\\\\n\\\\\\\\n\\\\n\\n\n
      '';
      sensors-header-tooltip-sensor2 = ''
        {"service":"hwmon","path":["nvme-{$10000e100}","Composite","input"]}\\\\\\\\\\\\\\\\n\\\\\\\\n\\\\n\\n\n
      '';
      sensors-indicators-order = "[\"icon\",\"value\"]";
      sensors-source = "auto";
      shell-bar-position = "top";
      storage-header-show = false;
      storage-indicators-order = "[\"icon\",\"bar\",\"percentage\",\"value\",\"free\",\"IO bar\",\"IO graph\",\"IO speed\"]";
      storage-main = "name-vg-nixos";
    };

    "org/gnome/shell/extensions/bedtime-mode" = {
      automatic-schedule = true;
      bedtime-mode-active = false;
      color-tone-factor = 75;
      color-tone-preset = "grayscale";
      ondemand-button-bar-manual-position = true;
      ondemand-button-bar-onoff-indicator = true;
      ondemand-button-bar-position-value = 7;
      ondemand-button-bar-scroll-enabled = true;
      ondemand-button-location = "menu";
      ondemand-button-visibility = "active-schedule";
      schedule-start-hours = 23;
    };

    "org/gnome/shell/extensions/blur-my-shell" = {
      brightness = 0.79;
      hacks-level = 3;
      noise-amount = 0.57;
      noise-lightness = 1.01;
    };

    "org/gnome/shell/extensions/blur-my-shell/applications" = {
      blur = true;
      blur-on-overview = false;
      brightness = 0.67;
      enable-all = false;
      opacity = 255;
      sigma = 118;
      whitelist = ["Alacritty"];
    };

    "org/gnome/shell/extensions/blur-my-shell/dash-to-dock" = {
      blur = true;
      corner-radius = 16;
      unblur-in-overview = false;
    };

    "org/gnome/shell/extensions/blur-my-shell/overview" = {
      style-components = 2;
    };

    "org/gnome/shell/extensions/caffeine" = {
      indicator-position-max = 5;
      toggle-state = true;
      user-enabled = true;
    };

    "org/gnome/shell/extensions/color-picker" = {
      enable-shortcut = true;
      enable-systray = false;
    };

    "org/gnome/shell/extensions/coverflowalttab" = {
      animation-time = 0.21;
      current-workspace-only = "all";
      easing-function = "ease-linear";
      hide-panel = false;
      highlight-mouse-over = true;
      icon-has-shadow = true;
      icon-style = "Overlay";
      position = "Top";
      switcher-background-color = mkTuple [1.0 1.0 1.0];
      switcher-looping-method = "Flip Stack";
      switcher-style = "Coverflow";
    };

    "org/gnome/shell/extensions/dash-to-dock" = {
      apply-custom-theme = true;
      background-opacity = 0.8;
      custom-theme-shrink = true;
      dash-max-icon-size = 48;
      disable-overview-on-startup = false;
      dock-position = "BOTTOM";
      height-fraction = 0.9;
      multi-monitor = true;
      preferred-monitor = -2;
      preferred-monitor-by-connector = "eDP-1";
      show-mounts-network = true;
    };

    "org/gnome/shell/extensions/forge" = {
      css-last-update = mkUint32 37;
      focus-border-toggle = false;
      move-pointer-focus-enabled = false;
      quick-settings-enabled = false;
      split-border-toggle = false;
      tiling-mode-enabled = true;
      window-gap-hidden-on-single = true;
      window-gap-size = mkUint32 8;
      window-gap-size-increment = mkUint32 1;
      workspace-skip-tile = "";
    };

    "org/gnome/shell/extensions/forge/keybindings" = {
      con-split-horizontal = ["<Super>z"];
      con-split-layout-toggle = ["<Super>g"];
      con-split-vertical = ["<Super>v"];
      con-stacked-layout-toggle = ["<Shift><Super>s"];
      con-tabbed-layout-toggle = ["<Shift><Super>t"];
      con-tabbed-showtab-decoration-toggle = ["<Control><Alt>y"];
      focus-border-toggle = ["<Super>x"];
      prefs-open = [];
      prefs-tiling-toggle = [];
      window-focus-down = ["<Super>j"];
      window-focus-left = ["<Super>h"];
      window-focus-right = ["<Super>l"];
      window-focus-up = ["<Super>k"];
      window-gap-size-decrease = ["<Control><Super>minus"];
      window-gap-size-increase = ["<Control><Super>plus"];
      window-move-down = ["<Shift><Super>j"];
      window-move-left = ["<Shift><Super>h"];
      window-move-right = ["<Shift><Super>l"];
      window-move-up = ["<Shift><Super>k"];
      window-resize-bottom-decrease = ["<Shift><Control><Super>i"];
      window-resize-bottom-increase = ["<Control><Super>u"];
      window-resize-left-decrease = ["<Shift><Control><Super>o"];
      window-resize-left-increase = ["<Control><Super>y"];
      window-resize-right-decrease = ["<Shift><Control><Super>y"];
      window-resize-right-increase = ["<Control><Super>o"];
      window-resize-top-decrease = ["<Shift><Control><Super>u"];
      window-resize-top-increase = ["<Control><Super>i"];
      window-snap-center = ["<Control><Alt>c"];
      window-snap-one-third-left = ["<Control><Alt>d"];
      window-snap-one-third-right = ["<Control><Alt>g"];
      window-snap-two-third-left = ["<Control><Alt>e"];
      window-snap-two-third-right = ["<Control><Alt>t"];
      window-swap-down = ["<Control><Super>j"];
      window-swap-last-active = ["<Super>Return"];
      window-swap-left = ["<Control><Super>h"];
      window-swap-right = ["<Control><Super>l"];
      window-swap-up = ["<Control><Super>k"];
      window-toggle-always-float = ["<Shift><Super>c"];
      window-toggle-float = ["<Shift><Super>f"];
      workspace-active-tile-toggle = [];
    };

    "org/gnome/shell/extensions/gsconnect" = {
      devices = [];
      enabled = true;
      id = "bbe337fb-6091-417a-81a6-6cde395ca9c7";
      name = "nixuse";
    };

    "org/gnome/shell/extensions/gsconnect/device/05936842_ff41_4791_b9f0_17f7ee6e0421" = {
      incoming-capabilities = ["kdeconnect.battery" "kdeconnect.bigscreen.stt" "kdeconnect.clipboard" "kdeconnect.clipboard.connect" "kdeconnect.contacts.request_all_uids_timestamps" "kdeconnect.contacts.request_vcards_by_uid" "kdeconnect.findmyphone.request" "kdeconnect.mousepad.keyboardstate" "kdeconnect.mousepad.request" "kdeconnect.mpris" "kdeconnect.mpris.request" "kdeconnect.notification" "kdeconnect.notification.action" "kdeconnect.notification.reply" "kdeconnect.notification.request" "kdeconnect.photo.request" "kdeconnect.ping" "kdeconnect.runcommand" "kdeconnect.sftp.request" "kdeconnect.share.request" "kdeconnect.share.request.update" "kdeconnect.sms.request" "kdeconnect.sms.request_attachment" "kdeconnect.sms.request_conversation" "kdeconnect.sms.request_conversations" "kdeconnect.systemvolume" "kdeconnect.telephony.request" "kdeconnect.telephony.request_mute"];
      last-connection = "lan://192.168.1.141:1716";
      name = "Galaxy S23 Ultra";
      outgoing-capabilities = ["kdeconnect.battery" "kdeconnect.bigscreen.stt" "kdeconnect.clipboard" "kdeconnect.clipboard.connect" "kdeconnect.connectivity_report" "kdeconnect.contacts.response_uids_timestamps" "kdeconnect.contacts.response_vcards" "kdeconnect.findmyphone.request" "kdeconnect.mousepad.echo" "kdeconnect.mousepad.keyboardstate" "kdeconnect.mousepad.request" "kdeconnect.mpris" "kdeconnect.mpris.request" "kdeconnect.notification" "kdeconnect.notification.request" "kdeconnect.photo" "kdeconnect.ping" "kdeconnect.presenter" "kdeconnect.runcommand.request" "kdeconnect.sftp" "kdeconnect.share.request" "kdeconnect.sms.attachment_file" "kdeconnect.sms.messages" "kdeconnect.systemvolume.request" "kdeconnect.telephony"];
      supported-plugins = ["battery" "clipboard" "connectivity_report" "contacts" "findmyphone" "mousepad" "mpris" "notification" "ping" "presenter" "runcommand" "sftp" "share" "sms" "systemvolume" "telephony"];
      type = "phone";
    };

    "org/gnome/shell/extensions/gsconnect/device/05936842_ff41_4791_b9f0_17f7ee6e0421/plugin/battery" = {
      custom-battery-notification-value = mkUint32 80;
    };

    "org/gnome/shell/extensions/gsconnect/device/05936842_ff41_4791_b9f0_17f7ee6e0421/plugin/clipboard" = {
      receive-content = true;
      send-content = true;
    };

    "org/gnome/shell/extensions/gsconnect/device/05936842_ff41_4791_b9f0_17f7ee6e0421/plugin/notification" = {
      applications = ''
        {"Printers":{"iconName":"org.gnome.Settings-printers-symbolic","enabled":true},"Evolution Alarm Notify":{"iconName":"appointment-soon","enabled":true},"Disks":{"iconName":"org.gnome.DiskUtility","enabled":true},"Date & Time":{"iconName":"org.gnome.Settings-time-symbolic","enabled":true},"Disk Usage Analyzer":{"iconName":"org.gnome.baobab","enabled":true},"Geary":{"iconName":"org.gnome.Geary","enabled":true},"Power":{"iconName":"org.gnome.Settings-power-symbolic","enabled":true},"Console":{"iconName":"org.gnome.Console","enabled":true},"Color":{"iconName":"org.gnome.Settings-color-symbolic","enabled":true},"Files":{"iconName":"org.gnome.Nautilus","enabled":true},"Clocks":{"iconName":"org.gnome.clocks","enabled":true},"Archive Manager":{"iconName":"org.gnome.FileRoller","enabled":true},"notify-send":{"iconName":"","enabled":true}}\\\\\\\\\\\\\\\\n\\\\\\\\n\\\\n\\n\n
      '';
    };

    "org/gnome/shell/extensions/gsconnect/device/05936842_ff41_4791_b9f0_17f7ee6e0421/plugin/share" = {
      receive-directory = "/home/zhenyu/Downloads";
    };

    "org/gnome/shell/extensions/gsconnect/device/21e0021c_155c_4e12_9a16_e93a0190e51e" = {
      incoming-capabilities = ["kdeconnect.battery" "kdeconnect.battery.request" "kdeconnect.bigscreen.stt" "kdeconnect.clipboard" "kdeconnect.clipboard.connect" "kdeconnect.connectivity_report.request" "kdeconnect.contacts.request_all_uids_timestamps" "kdeconnect.contacts.request_vcards_by_uid" "kdeconnect.findmyphone.request" "kdeconnect.mousepad.keyboardstate" "kdeconnect.mousepad.request" "kdeconnect.mpris" "kdeconnect.mpris.request" "kdeconnect.notification" "kdeconnect.notification.action" "kdeconnect.notification.reply" "kdeconnect.notification.request" "kdeconnect.photo.request" "kdeconnect.ping" "kdeconnect.runcommand" "kdeconnect.sftp.request" "kdeconnect.share.request" "kdeconnect.share.request.update" "kdeconnect.sms.request" "kdeconnect.sms.request_attachment" "kdeconnect.sms.request_conversation" "kdeconnect.sms.request_conversations" "kdeconnect.systemvolume" "kdeconnect.telephony.request" "kdeconnect.telephony.request_mute"];
      last-connection = "lan://192.168.1.147:1716";
      name = "LE2120";
      outgoing-capabilities = ["kdeconnect.battery" "kdeconnect.battery.request" "kdeconnect.bigscreen.stt" "kdeconnect.clipboard" "kdeconnect.clipboard.connect" "kdeconnect.connectivity_report" "kdeconnect.contacts.response_uids_timestamps" "kdeconnect.contacts.response_vcards" "kdeconnect.findmyphone.request" "kdeconnect.mousepad.echo" "kdeconnect.mousepad.keyboardstate" "kdeconnect.mousepad.request" "kdeconnect.mpris" "kdeconnect.mpris.request" "kdeconnect.notification" "kdeconnect.notification.request" "kdeconnect.photo" "kdeconnect.ping" "kdeconnect.presenter" "kdeconnect.runcommand.request" "kdeconnect.sftp" "kdeconnect.share.request" "kdeconnect.sms.attachment_file" "kdeconnect.sms.messages" "kdeconnect.systemvolume.request" "kdeconnect.telephony"];
      supported-plugins = ["battery" "clipboard" "connectivity_report" "contacts" "findmyphone" "mousepad" "mpris" "notification" "ping" "presenter" "runcommand" "sftp" "share" "sms" "systemvolume" "telephony"];
      type = "phone";
    };

    "org/gnome/shell/extensions/gsconnect/device/_4927fd63_aac9_455a_afc2_09441434b5f7_" = {
      incoming-capabilities = ["kdeconnect.battery" "kdeconnect.battery.request" "kdeconnect.bigscreen.stt" "kdeconnect.clipboard" "kdeconnect.clipboard.connect" "kdeconnect.connectivity_report" "kdeconnect.contacts.response_uids_timestamps" "kdeconnect.contacts.response_vcards" "kdeconnect.findmyphone.request" "kdeconnect.lock" "kdeconnect.lock.request" "kdeconnect.mousepad.echo" "kdeconnect.mousepad.keyboardstate" "kdeconnect.mousepad.request" "kdeconnect.mpris" "kdeconnect.mpris.request" "kdeconnect.notification" "kdeconnect.notification.request" "kdeconnect.photo" "kdeconnect.ping" "kdeconnect.presenter" "kdeconnect.runcommand" "kdeconnect.runcommand.request" "kdeconnect.sftp" "kdeconnect.share.request" "kdeconnect.sms.attachment_file" "kdeconnect.sms.messages" "kdeconnect.systemvolume" "kdeconnect.systemvolume.request" "kdeconnect.telephony" "kdeconnect.telephony.request_mute" "kdeconnect.virtualmonitor" "kdeconnect.virtualmonitor.request"];
      last-connection = "lan://192.168.1.106:1716";
      name = "nixuse";
      outgoing-capabilities = ["kdeconnect.battery" "kdeconnect.battery.request" "kdeconnect.bigscreen.stt" "kdeconnect.clipboard" "kdeconnect.clipboard.connect" "kdeconnect.connectivity_report.request" "kdeconnect.contacts.request_all_uids_timestamps" "kdeconnect.contacts.request_vcards_by_uid" "kdeconnect.findmyphone.request" "kdeconnect.lock" "kdeconnect.lock.request" "kdeconnect.mousepad.keyboardstate" "kdeconnect.mousepad.request" "kdeconnect.mpris" "kdeconnect.mpris.request" "kdeconnect.notification" "kdeconnect.notification.action" "kdeconnect.notification.reply" "kdeconnect.notification.request" "kdeconnect.photo.request" "kdeconnect.ping" "kdeconnect.runcommand" "kdeconnect.runcommand.request" "kdeconnect.sftp.request" "kdeconnect.share.request" "kdeconnect.share.request.update" "kdeconnect.sms.request" "kdeconnect.sms.request_attachment" "kdeconnect.sms.request_conversation" "kdeconnect.sms.request_conversations" "kdeconnect.systemvolume" "kdeconnect.systemvolume.request" "kdeconnect.telephony" "kdeconnect.telephony.request_mute" "kdeconnect.virtualmonitor" "kdeconnect.virtualmonitor.request"];
      supported-plugins = ["battery" "clipboard" "findmyphone" "mousepad" "mpris" "notification" "ping" "runcommand" "share" "systemvolume" "telephony"];
      type = "desktop";
    };

    "org/gnome/shell/extensions/gsconnect/device/_4927fd63_aac9_455a_afc2_09441434b5f7_/plugin/battery" = {
      custom-battery-notification-value = mkUint32 80;
    };

    "org/gnome/shell/extensions/gsconnect/device/_4927fd63_aac9_455a_afc2_09441434b5f7_/plugin/notification" = {
      applications = ''
        {"Printers":{"iconName":"org.gnome.Settings-printers-symbolic","enabled":true},"Evolution Alarm Notify":{"iconName":"appointment-soon","enabled":true},"Disks":{"iconName":"org.gnome.DiskUtility","enabled":true},"Date & Time":{"iconName":"org.gnome.Settings-time-symbolic","enabled":true},"Power":{"iconName":"org.gnome.Settings-power-symbolic","enabled":true},"Disk Usage Analyzer":{"iconName":"org.gnome.baobab","enabled":true},"Geary":{"iconName":"org.gnome.Geary","enabled":true},"Console":{"iconName":"org.gnome.Console","enabled":true},"Color":{"iconName":"org.gnome.Settings-color-symbolic","enabled":true},"Files":{"iconName":"org.gnome.Nautilus","enabled":true},"Clocks":{"iconName":"org.gnome.clocks","enabled":true},"Archive Manager":{"iconName":"org.gnome.FileRoller","enabled":true}}\\\\\\\\\\\\\\\\n\\\\\\\\n\\\\n\\n\n
      '';
    };

    "org/gnome/shell/extensions/gsconnect/device/_4927fd63_aac9_455a_afc2_09441434b5f7_/plugin/share" = {
      receive-directory = "/home/zhenyu/Downloads";
    };

    "org/gnome/shell/extensions/gsconnect/device/_50a4c0be_585c_432b_a7bf_dbe32f8f83c8_" = {
      incoming-capabilities = ["kdeconnect.clipboard" "kdeconnect.clipboard.connect" "kdeconnect.connectivity_report" "kdeconnect.contacts.response_uids_timestamps" "kdeconnect.contacts.response_vcards" "kdeconnect.findmyphone.request" "kdeconnect.lock" "kdeconnect.lock.request" "kdeconnect.mousepad.echo" "kdeconnect.mousepad.keyboardstate" "kdeconnect.mousepad.request" "kdeconnect.mpris" "kdeconnect.mpris.request" "kdeconnect.notification" "kdeconnect.notification.request" "kdeconnect.ping" "kdeconnect.presenter" "kdeconnect.runcommand" "kdeconnect.runcommand.request" "kdeconnect.sftp" "kdeconnect.share.request" "kdeconnect.sms.attachment_file" "kdeconnect.sms.messages" "kdeconnect.systemvolume" "kdeconnect.systemvolume.request" "kdeconnect.telephony" "kdeconnect.virtualmonitor" "kdeconnect.virtualmonitor.request"];
      last-connection = "lan://192.168.1.185:1716";
      name = "AlienKing";
      outgoing-capabilities = ["kdeconnect.clipboard" "kdeconnect.clipboard.connect" "kdeconnect.contacts.request_all_uids_timestamps" "kdeconnect.contacts.request_vcards_by_uid" "kdeconnect.findmyphone.request" "kdeconnect.lock" "kdeconnect.lock.request" "kdeconnect.mousepad.keyboardstate" "kdeconnect.mousepad.request" "kdeconnect.mpris" "kdeconnect.mpris.request" "kdeconnect.notification" "kdeconnect.notification.action" "kdeconnect.notification.reply" "kdeconnect.notification.request" "kdeconnect.ping" "kdeconnect.runcommand" "kdeconnect.runcommand.request" "kdeconnect.sftp.request" "kdeconnect.share.request" "kdeconnect.share.request.update" "kdeconnect.sms.request" "kdeconnect.sms.request_attachment" "kdeconnect.sms.request_conversation" "kdeconnect.sms.request_conversations" "kdeconnect.systemvolume" "kdeconnect.systemvolume.request" "kdeconnect.telephony.request_mute" "kdeconnect.virtualmonitor" "kdeconnect.virtualmonitor.request"];
      supported-plugins = ["clipboard" "findmyphone" "mousepad" "mpris" "notification" "ping" "runcommand" "share" "systemvolume"];
      type = "desktop";
    };

    "org/gnome/shell/extensions/gsconnect/device/_a5b1bde4_dfb2_4dca_b388_7124681e68f1_" = {
      certificate-pem = "-----BEGIN CERTIFICATE-----nMIIDVzCCAj+gAwIBAgIBCjANBgkqhkiG9w0BAQUFADBVMS8wLQYDVQQDDCZfYTVinMWJkZTRfZGZiMl80ZGNhX2IzODhfNzEyNDY4MWU2OGYxXzEMMAoGA1UECgwDS0RFnMRQwEgYDVQQLDAtLZGUgY29ubmVjdDAeFw0yMTAzMjUwMDQ3MTFaFw0zMTAzMjUwnMDQ3MTFaMFUxLzAtBgNVBAMMJl9hNWIxYmRlNF9kZmIyXzRkY2FfYjM4OF83MTI0nNjgxZTY4ZjFfMQwwCgYDVQQKDANLREUxFDASBgNVBAsMC0tkZSBjb25uZWN0MIIBnIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAw9OjLDVqJTLZIdiDie+bgWnOnRIVeUcu8JtR8KpmmXmwWhsVGLtb9lZufpTLjK+PalDU32NDAetueDAwcdnq/XLkmni3ZJZhZYl0iCh5Wn4OwtSJQkADzH8J1Abhir/wG5f7aiTSkbNgErM9xWlkB9jrz4nS7hQwGW2qtVixWkVFkAITuH1nThtgoXoeVyTJlYuXLY/V9CyqnjwpWGszbYCW/yZn4x53f13rIKBPk0JedEfD1V5VMbi/PIfp2BeCcGd2fMKNs++OB1pco1LOBkQLWvxKnbkW05V3QnFIZobERGfVXQE1NzN3dBpex/GGp6WX2OWV5nBq2TObY5sh3dqL5pwIDnAQABozIwMDAdBgNVHQ4EFgQUNXnlP03aFwCdPn81EW2KcLM02NcwDwYDVR0TAQH/nBAUwAwIBADANBgkqhkiG9w0BAQUFAAOCAQEAslmz/FQj0nqe7VBiXZuvAg0UNSFTnvs6vSeC2NDY4pUlpz9KTUP7BbsIIYJml24iRBtry56BBZ58ZMgoKr6KuHtmokykwnLVyrolQ7By3rZPCmBUFzTLrxoATcWyrQx9BJ+LKl3IP9VcghlQd7aumCKw9LDAgHnsSEgEqlBTCvqESedkZysO/XLHieRgS5OV/Ow1XxW2Hyrgr2g0gECqK4Y+1Udhvj8nETnYyvO1Ic4hJXlxrhZa/USI2PrNKKkZDqzzR7X2dzdFMLPa9h+HtnRbLJYNcKsCnuXNa76a+vqLAdXNjrf3476iLtf9FPK3+cEA16TXOSfaM7v/Dqe4+ktTb3Q==n-----END CERTIFICATE-----n";
      incoming-capabilities = ["kdeconnect.battery" "kdeconnect.bigscreen.stt" "kdeconnect.clipboard" "kdeconnect.clipboard.connect" "kdeconnect.connectivity_report" "kdeconnect.contacts.response_uids_timestamps" "kdeconnect.contacts.response_vcards" "kdeconnect.findmyphone.request" "kdeconnect.lock" "kdeconnect.lock.request" "kdeconnect.mousepad.echo" "kdeconnect.mousepad.keyboardstate" "kdeconnect.mousepad.request" "kdeconnect.mpris" "kdeconnect.mpris.request" "kdeconnect.notification" "kdeconnect.notification.request" "kdeconnect.ping" "kdeconnect.presenter" "kdeconnect.runcommand" "kdeconnect.runcommand.request" "kdeconnect.sftp" "kdeconnect.share.request" "kdeconnect.sms.attachment_file" "kdeconnect.sms.messages" "kdeconnect.systemvolume" "kdeconnect.systemvolume.request" "kdeconnect.telephony" "kdeconnect.telephony.request_mute" "kdeconnect.virtualmonitor" "kdeconnect.virtualmonitor.request"];
      last-connection = "lan://192.168.1.185:1716";
      name = "alienbxuse";
      outgoing-capabilities = ["kdeconnect.battery" "kdeconnect.bigscreen.stt" "kdeconnect.clipboard" "kdeconnect.clipboard.connect" "kdeconnect.contacts.request_all_uids_timestamps" "kdeconnect.contacts.request_vcards_by_uid" "kdeconnect.findmyphone.request" "kdeconnect.lock" "kdeconnect.lock.request" "kdeconnect.mousepad.keyboardstate" "kdeconnect.mousepad.request" "kdeconnect.mpris" "kdeconnect.mpris.request" "kdeconnect.notification" "kdeconnect.notification.action" "kdeconnect.notification.reply" "kdeconnect.notification.request" "kdeconnect.ping" "kdeconnect.runcommand" "kdeconnect.runcommand.request" "kdeconnect.sftp.request" "kdeconnect.share.request" "kdeconnect.share.request.update" "kdeconnect.sms.request" "kdeconnect.sms.request_attachment" "kdeconnect.sms.request_conversation" "kdeconnect.sms.request_conversations" "kdeconnect.systemvolume" "kdeconnect.systemvolume.request" "kdeconnect.telephony" "kdeconnect.telephony.request_mute" "kdeconnect.virtualmonitor" "kdeconnect.virtualmonitor.request"];
      paired = true;
      supported-plugins = ["battery" "clipboard" "findmyphone" "mousepad" "mpris" "notification" "ping" "runcommand" "share" "systemvolume" "telephony"];
      type = "desktop";
    };

    "org/gnome/shell/extensions/gsconnect/device/_a5b1bde4_dfb2_4dca_b388_7124681e68f1_/plugin/battery" = {
      custom-battery-notification-value = mkUint32 80;
    };

    "org/gnome/shell/extensions/gsconnect/device/_a5b1bde4_dfb2_4dca_b388_7124681e68f1_/plugin/clipboard" = {
      receive-content = true;
      send-content = true;
    };

    "org/gnome/shell/extensions/gsconnect/device/_a5b1bde4_dfb2_4dca_b388_7124681e68f1_/plugin/notification" = {
      applications = ''
        {"Printers":{"iconName":"org.gnome.Settings-printers-symbolic","enabled":true},"calibre":{"iconName":"calibre-gui","enabled":true},"Evolution Alarm Notify":{"iconName":"appointment-soon","enabled":true},"Disks":{"iconName":"org.gnome.DiskUtility","enabled":true},"Date & Time":{"iconName":"org.gnome.Settings-time-symbolic","enabled":true},"Disk Usage Analyzer":{"iconName":"org.gnome.baobab","enabled":true},"Geary":{"iconName":"org.gnome.Geary","enabled":true},"Power":{"iconName":"org.gnome.Settings-power-symbolic","enabled":true},"Console":{"iconName":"org.gnome.Console","enabled":true},"Color":{"iconName":"org.gnome.Settings-color-symbolic","enabled":true},"Files":{"iconName":"org.gnome.Nautilus","enabled":true},"Clocks":{"iconName":"org.gnome.clocks","enabled":true},"Archive Manager":{"iconName":"org.gnome.FileRoller","enabled":true}}\\\\\\\\n\\\\n\\n\n
      '';
    };

    "org/gnome/shell/extensions/gsconnect/device/_a5b1bde4_dfb2_4dca_b388_7124681e68f1_/plugin/share" = {
      receive-directory = "/home/zhenyu/Downloads";
    };

    "org/gnome/shell/extensions/gsconnect/messaging" = {
      window-maximized = false;
      window-size = mkTuple [948 985];
    };

    "org/gnome/shell/extensions/gsconnect/preferences" = {
      window-maximized = false;
      window-size = mkTuple [948 985];
    };

    "org/gnome/shell/extensions/just-perfection" = {
      accessibility-menu = true;
      background-menu = true;
      clock-menu-position = 1;
      clock-menu-position-offset = 20;
      controls-manager-spacing-size = 0;
      dash = true;
      dash-icon-size = 0;
      double-super-to-appgrid = true;
      notification-banner-position = 0;
      osd = true;
      overlay-key = true;
      panel = true;
      panel-in-overview = true;
      ripple-box = true;
      search = true;
      show-apps-button = true;
      startup-status = 1;
      theme = false;
      window-demands-attention-focus = false;
      window-picker-icon = true;
      window-preview-caption = true;
      window-preview-close-button = true;
      workspace = true;
      workspace-background-corner-size = 0;
      workspace-popup = true;
      workspace-switcher-should-show = false;
      workspaces-in-app-grid = true;
      world-clock = true;
    };

    "org/gnome/shell/extensions/lennart-k/rounded_corners" = {
      corner-radius = 16;
    };

    "org/gnome/shell/extensions/mediacontrols" = {
      colored-player-icon = false;
      label-width = mkUint32 200;
      show-control-icons-next = false;
      show-control-icons-play = true;
      show-control-icons-previous = false;
      show-control-icons-seek-backward = false;
      show-control-icons-seek-forward = false;
      show-label = true;
    };

    "org/gnome/shell/extensions/netspeedsimplified" = {
      chooseiconset = 0;
      fontmode = 1;
      iconstoright = false;
      isvertical = true;
      limitunit = 3;
      lockmouseactions = true;
      minwidth = 6.0;
      mode = 2;
      restartextension = false;
      reverseindicators = true;
      shortenunits = true;
      systemcolr = true;
      textalign = 1;
      togglebool = false;
      wposext = 1;
    };

    "org/gnome/shell/extensions/nightlightsliderupdated" = {
      brightness-sync = false;
      enable-always = true;
      minimum = 2400;
      show-always = true;
      show-status-icon = false;
      swap-axis = true;
    };

    "org/gnome/shell/extensions/paperwm" = {
      default-focus-mode = 2;
      restore-attach-modal-dialogs = "";
      restore-edge-tiling = "";
      restore-keybinds = ''
        {}\\\\\\\\\\\\\\\\n\\\\\\\\n\\\\n\\n\n
      '';
      restore-workspaces-only-on-primary = "";
      show-workspace-indicator = false;
    };

    "org/gnome/shell/extensions/paperwm/workspaces" = {
      list = ["3ebd6bad-e733-43b7-8e43-9e51f26a5d2f" "160ec9e2-637d-4f77-84a8-3eaa59c051f5" "3f7546ea-37cf-4851-8149-927ea92bf68a" "efb4d794-528a-4cbf-b37d-395cb523ef1e"];
    };

    "org/gnome/shell/extensions/paperwm/workspaces/160ec9e2-637d-4f77-84a8-3eaa59c051f5" = {
      index = 1;
    };

    "org/gnome/shell/extensions/paperwm/workspaces/3ebd6bad-e733-43b7-8e43-9e51f26a5d2f" = {
      index = 0;
    };

    "org/gnome/shell/extensions/paperwm/workspaces/3f7546ea-37cf-4851-8149-927ea92bf68a" = {
      index = 2;
    };

    "org/gnome/shell/extensions/paperwm/workspaces/efb4d794-528a-4cbf-b37d-395cb523ef1e" = {
      index = 3;
    };

    "org/gnome/shell/extensions/status-area-horizontal-spacing" = {
      hpadding = 1;
    };

    "org/gnome/shell/extensions/system-monitor" = {
      battery-position = 9;
      center-display = false;
      compact-display = false;
      cpu-display = false;
      cpu-position = 1;
      cpu-show-menu = false;
      cpu-show-text = false;
      cpu-style = "digit";
      disk-position = 6;
      fan-position = 8;
      fan-sensor-file = "/sys/class/hwmon/hwmon9/fan1_input";
      freq-position = 2;
      gpu-position = 7;
      icon-display = false;
      memory-display = false;
      memory-position = 3;
      memory-show-menu = false;
      memory-show-text = false;
      move-clock = true;
      net-display = false;
      net-graph-width = 40;
      net-position = 5;
      net-show-menu = false;
      net-show-text = false;
      net-speed-in-bits = false;
      net-style = "digit";
      show-tooltip = true;
      swap-position = 4;
      thermal-display = false;
      thermal-position = 0;
      thermal-sensor-file = "/sys/class/hwmon/hwmon7/temp2_input";
      thermal-show-menu = false;
      thermal-show-text = false;
      thermal-style = "digit";
      tooltip-delay-ms = 0;
    };

    "org/gnome/shell/extensions/tiling-assistant" = {
      activate-layout0 = [];
      activate-layout1 = [];
      activate-layout2 = [];
      activate-layout3 = [];
      active-window-hint = 1;
      active-window-hint-color = "rgb(53,132,228)";
      auto-tile = [];
      center-window = [];
      debugging-free-rects = [];
      debugging-show-tiled-rects = [];
      default-move-mode = 0;
      dynamic-keybinding-behavior = 2;
      import-layout-examples = false;
      last-version-installed = 46;
      restore-window = ["<Super>Down"];
      search-popup-layout = [];
      tile-bottom-half = ["<Super>KP_2"];
      tile-bottom-half-ignore-ta = [];
      tile-bottomleft-quarter = ["<Super>KP_1"];
      tile-bottomleft-quarter-ignore-ta = [];
      tile-bottomright-quarter = ["<Super>KP_3"];
      tile-bottomright-quarter-ignore-ta = [];
      tile-edit-mode = ["<Super>Return"];
      tile-left-half = ["<Super>Left" "<Super>KP_4"];
      tile-left-half-ignore-ta = [];
      tile-maximize = ["<Super>Up" "<Super>KP_5"];
      tile-maximize-horizontally = [];
      tile-maximize-vertically = [];
      tile-right-half = ["<Super>Right" "<Super>KP_6"];
      tile-right-half-ignore-ta = [];
      tile-top-half = [];
      tile-top-half-ignore-ta = [];
      tile-topleft-quarter = ["<Super>KP_7"];
      tile-topleft-quarter-ignore-ta = [];
      tile-topright-quarter = ["<Super>KP_9"];
      tile-topright-quarter-ignore-ta = [];
      tiling-popup-all-workspace = true;
      toggle-always-on-top = [];
      toggle-tiling-popup = [];
      window-gap = 0;
    };

    "org/gnome/shell/extensions/unite" = {
      app-menu-ellipsize-mode = "middle";
      app-menu-max-width = 0;
      enable-titlebar-actions = true;
      extend-left-box = false;
      greyscale-tray-icons = false;
      hide-activities-button = "auto";
      hide-app-menu-icon = false;
      hide-window-titlebars = "always";
      notifications-position = "right";
      reduce-panel-spacing = true;
      restrict-to-primary-screen = false;
      show-appmenu-button = true;
      show-desktop-name = false;
      show-legacy-tray = true;
      show-window-buttons = "never";
      show-window-title = "never";
      use-activities-text = false;
      window-buttons-placement = "auto";
      window-buttons-theme = "auto";
    };

    "org/gnome/shell/extensions/user-theme" = {
      name = "";
    };

    "org/gnome/shell/extensions/vitals" = {
      hide-icons = false;
      hide-zeros = false;
      icon-style = 1;
      menu-centered = false;
      update-time = 2;
    };

    "org/gnome/shell/keybindings" = {
      focus-active-notification = ["<Super>n"];
      shift-overview-down = ["<Super><Alt>Down"];
      shift-overview-up = ["<Super><Alt>Up"];
      show-screenshot-ui = ["<Super>p"];
      toggle-application-view = [];
      toggle-message-tray = [];
      toggle-quick-settings = [];
    };

    "org/gnome/shell/weather" = {
      automatic-location = true;
      locations = [(mkVariant [(mkUint32 2) (mkVariant ["Los Angeles" "KCQT" true [(mkTuple [0.5937028397045019 (-2.064433611082862)])] [(mkTuple [0.5943236009595587 (-2.063741622941031)])]])])];
    };

    "org/gnome/shell/world-clocks" = {
      locations = [(mkVariant [(mkUint32 2) (mkVariant ["Wuhan" "ZHHH" true [(mkTuple [0.5343616451366947 1.9920024471250972])] [(mkTuple [0.5337798570838349 1.9943295644299512])]])])];
    };

    "org/gnome/simple-scan" = {
      document-type = "photo";
    };

    "org/gnome/system/location" = {
      enabled = true;
    };

    "org/gnome/tweaks" = {
      show-extensions-notice = false;
    };

    "org/gtk/gtk4/settings/color-chooser" = {
      custom-colors = [(mkTuple [0.94902 0.0 0.180392 1.0]) (mkTuple [6.6667e-2 0.780392 0.878431 1.0]) (mkTuple [0.92549 0.368627 0.368627 1.0])];
      selected-color = mkTuple [true 0.94902 0.0 0.180392 1.0];
    };

    "org/gtk/gtk4/settings/file-chooser" = {
      date-format = "regular";
      location-mode = "path-bar";
      show-hidden = false;
      show-size-column = true;
      show-type-column = true;
      sidebar-width = 140;
      sort-column = "name";
      sort-directories-first = true;
      sort-order = "ascending";
      type-format = "category";
      view-type = "grid";
      window-size = mkTuple [1017 701];
    };

    "org/gtk/settings/color-chooser" = {
      custom-colors = [(mkTuple [0.286275 0.658824 0.207843 1.0])];
      selected-color = mkTuple [true 0.286275 0.658824 0.207843 1.0];
    };

    "org/gtk/settings/file-chooser" = {
      date-format = "regular";
      location-mode = "path-bar";
      show-hidden = false;
      show-size-column = true;
      show-type-column = true;
      sidebar-width = 156;
      sort-column = "modified";
      sort-directories-first = false;
      sort-order = "descending";
      type-format = "category";
      window-position = mkTuple [26 23];
      window-size = mkTuple [936 604];
    };
  };
}
