# Generated via dconf2nix: https://github.com/gvolpe/dconf2nix
{
  lib,
  user-homedir,
  ...
}:
with lib.hm.gvariant; {
  dconf.settings = {
    "org/freedesktop/tracker/miner/files" = {
      index-recursive-directories = ["&DESKTOP" "&DOCUMENTS" "&MUSIC" "&PICTURES" "&VIDEOS" "${user-homedir}/Media/Music"];
    };

    "org/gnome/Totem" = {
      active-plugins = ["skipto" "variable-rate" "apple-trailers" "open-directory" "rotation" "save-file" "screensaver" "vimeo" "screenshot" "mpris" "movie-properties" "autoload-subtitles" "recent"];
      subtitle-encoding = "UTF-8";
    };

    "org/gnome/desktop/a11y/applications" = {
      screen-keyboard-enabled = false;
      screen-magnifier-enabled = false;
      screen-reader-enabled = false;
    };

    "org/gnome/desktop/a11y/keyboard" = {
      bouncekeys-beep-reject = true;
      bouncekeys-enable = false;
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
      picture-uri = "file://${user-homedir}/.local/share/wallpapers/city.jpg";
      picture-uri-dark = "file://${user-homedir}/.local/share/wallpapers/city.jpg";
      primary-color = "#3071AE";
      secondary-color = "#000000";
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
      mru-sources = [(mkTuple ["xkb" "us"]) (mkTuple ["ibus" "libpinyin"])];
      per-window = true;
      sources = [(mkTuple ["xkb" "us"]) (mkTuple ["ibus" "libpinyin"])];
      xkb-options = ["terminate:ctrl_alt_bksp" "compose:rctrl" "lv3:menu_switch" "altwin:swap_lalt_lwin"];
    };

    "org/gnome/desktop/interface" = {
      clock-show-seconds = false;
      clock-show-weekday = true;
      color-scheme = "prefer-dark";
      cursor-blink = false;
      cursor-size = 24;
      cursor-theme = "capitaine-cursors-white";
      enable-animations = false;
      enable-hot-corners = false;
      font-antialiasing = "grayscale";
      font-hinting = "slight";
      font-name = "Noto Sans,  10";
      gtk-theme = "Adwaita";
      icon-theme = "Adwaita";
      locate-pointer = false;
      scaling-factor = mkUint32 1;
      show-battery-percentage = true;
      text-scaling-factor = 1.0;
      toolbar-style = "text";
      toolkit-accessibility = false;
    };

    "org/gnome/desktop/peripherals/keyboard" = {
      delay = mkUint32 150;
      repeat-interval = mkUint32 5;
    };

    "org/gnome/desktop/peripherals/mouse" = {
      accel-profile = "flat";
      left-handed = false;
      natural-scroll = false;
      speed = 0.0;
    };

    "org/gnome/desktop/peripherals/touchpad" = {
      accel-profile = "flat";
      click-method = "fingers";
      edge-scrolling-enabled = false;
      natural-scroll = true;
      tap-to-click = true;
      two-finger-scrolling-enabled = true;
    };

    "org/gnome/desktop/privacy" = {
      old-files-age = mkUint32 30;
      recent-files-max-age = -1;
    };

    "org/gnome/desktop/screensaver" = {
      color-shading-type = "solid";
      lock-enabled = true;
      picture-options = "zoom";
      picture-uri = "file:///run/current-system/sw/share/backgrounds/gnome/adwaita-l.jxl";
      primary-color = "#3071AE";
      secondary-color = "#000000";
    };

    "org/gnome/desktop/search-providers" = {
      sort-order = ["org.gnome.Contacts.desktop" "org.gnome.Documents.desktop" "org.gnome.Nautilus.desktop"];
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
      move-to-workspace-down = ["<Control><Shift><Alt>Down"];
      move-to-workspace-left = ["<Super><Shift>Page_Up" "<Super><Shift><Alt>Left" "<Control><Shift><Alt>Left"];
      move-to-workspace-right = ["<Super><Shift>Page_Down" "<Super><Shift><Alt>Right" "<Control><Shift><Alt>Right"];
      move-to-workspace-up = ["<Control><Shift><Alt>Up"];
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
      workspace-names = ["Workspace 1" "Workspace 2" "Workspace 3" "Workspace 4"];
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

    "org/gnome/settings-daemon/plugins/color" = {
      night-light-enabled = true;
      night-light-last-coordinates = mkTuple [30.582886232884718 114.2681];
      night-light-schedule-automatic = false;
      night-light-schedule-from = 16.0;
      night-light-schedule-to = 4.0;
      night-light-temperature = mkUint32 3216;
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
      screensaver = ["<Super>Delete"];
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

    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2" = lib.mkDefault {
      binding = "<Super>space";
      command = "alacritty";
      name = "Terminal";
    };

    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom3" = {
      binding = "<Super>s";
      command = "firefox";
      name = "Browser";
    };

    "org/gnome/settings-daemon/plugins/power" = {
      ambient-enabled = true;
      sleep-inactive-ac-type = "suspend";
      sleep-inactive-battery-type = "suspend";
    };

    "org/gnome/settings-daemon/plugins/sharing/gnome-user-share-webdav" = {
      enabled-connections = [];
    };

    "org/gnome/shell" = {
      command-history = ["lg" "xiccdf" "xiccd"];
      disable-user-extensions = false;
      disabled-extensions = ["light-style@gnome-shell-extensions.gcampax.github.com" "native-window-placement@gnome-shell-extensions.gcampax.github.com" "tiling-assistant@leleat-on-github" "Rounded_Corners@lennart-k" "auto-move-windows@gnome-shell-extensions.gcampax.github.com" "Vitals@CoreCoding.com" "netspeedsimplified@prateekmedia.extension" "apps-menu@gnome-shell-extensions.gcampax.github.com" "cronomix@zagortenay333" "gnomebedtime@ionutbortis.gmail.com" "system-monitor@gnome-shell-extensions.gcampax.github.com" "places-menu@gnome-shell-extensions.gcampax.github.com" "paperwm@paperwm.github.com" "rounded-window-corners@fxgn" "gtk4-ding@smedius.gitlab.com" "window-list@gnome-shell-extensions.gcampax.github.com"];
      enabled-extensions = ["screenshot-window-sizer@gnome-shell-extensions.gcampax.github.com" "drive-menu@gnome-shell-extensions.gcampax.github.com" "kimpanel@kde.org" "gsconnect@andyholmes.github.io" "night-light-slider-updated@vilsbeg.codeberg.org" "color-picker@tuberry" "caffeine@patapon.info" "Bluetooth-Battery-Meter@maniacx.github.com" "hide-cursor@elcste.com" "monitor@astraext.github.io" "workspace-indicator@gnome-shell-extensions.gcampax.github.com" "unite@hardpixel.eu" "mediacontrols@cliffniff.github.com" "system-monitor-next@paradoxxx.zero.gmail.com" "forge@jmmaranan.com" "no-overview@fthx" "user-theme@gnome-shell-extensions.gcampax.github.com" "azwallpaper@azwallpaper.gitlab.com" "blur-my-shell@aunetx"];
      favorite-apps = ["org.gnome.Settings.desktop" "org.gnome.Nautilus.desktop" "org.gnome.Extensions.desktop" "org.gnome.Calendar.desktop" "firefox.desktop" "steam.desktop" "org.wezfurlong.wezterm.desktop" "com.github.xournalpp.xournalpp.desktop"];
      last-selected-power-profile = "power-saver";
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
      headers-height = 0;
      headers-height-override = 0;
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
      network-update = 2.0;
      panel-box-order = 0;
      panel-margin-left = 0;
      processor-header-bars = false;
      processor-header-bars-core = true;
      processor-header-graph = true;
      processor-header-graph-breakdown = true;
      processor-header-graph-width = 29;
      processor-header-icon = false;
      processor-header-percentage = false;
      processor-header-percentage-core = false;
      processor-header-show = true;
      processor-header-tooltip-percentage-core = false;
      processor-indicators-order = "[\"icon\",\"bar\",\"graph\",\"percentage\"]";
      processor-menu-gpu-color = "";
      processor-update = 2.0;
      profiles = ''
        {"default":{"panel-margin-left":0,"sensors-header-tooltip-sensor2-digits":-1,"memory-update":3,"gpu-header-memory-graph-color1":"rgba(29,172,214,1.0)","panel-box":"right","memory-header-show":false,"network-header-tooltip-io":true,"processor-header-bars-color2":"rgba(214,29,29,1.0)","processor-header-icon-size":18,"storage-source-storage-io":"auto","sensors-header-tooltip-sensor4-name":"","storage-header-icon-color":"","network-source-public-ipv4":"https://api.ipify.org","storage-header-io-graph-color2":"rgba(214,29,29,1.0)","storage-header-io":false,"processor-menu-top-processes-percentage-core":true,"sensors-header-sensor1":"{\\"service\\":\\"hwmon\\",\\"path\\":[\\"coretemp\\",\\"Core 8\\",\\"input\\"]}\\n","processor-header-graph":true,"storage-header-graph-width":30,"network-header-bars":false,"processor-source-load-avg":"auto","network-menu-arrow-color1":"rgba(29,172,214,1.0)","storage-header-io-graph-color1":"rgba(29,172,214,1.0)","gpu-header-icon":true,"processor-menu-graph-breakdown":true,"sensors-header-icon-custom":"","sensors-header-sensor2":"\\"\\"","network-header-icon-alert-color":"rgba(235, 64, 52, 1)","memory-header-tooltip-free":false,"storage-header-io-figures":2,"network-menu-arrow-color2":"rgba(214,29,29,1.0)","sensors-header-tooltip-sensor3-name":"","network-source-public-ipv6":"https://api6.ipify.org","monitors-order":"[\\"sensors\\",\\"network\\",\\"processor\\",\\"gpu\\",\\"memory\\",\\"storage\\"]","network-header-graph":false,"network-indicators-order":"[\\"icon\\",\\"IO bar\\",\\"IO speed\\",\\"IO graph\\"]","memory-header-percentage":false,"processor-header-tooltip":true,"gpu-main":"\\"\\"","storage-header-bars":true,"sensors-header-tooltip-sensor5-digits":-1,"memory-menu-swap-color":"rgba(29,172,214,1.0)","storage-io-unit":"kB/s","memory-header-graph-width":30,"processor-header-graph-color1":"rgba(29,172,214,1.0)","storage-header-tooltip-value":false,"gpu-header-icon-custom":"","processor-header-graph-breakdown":true,"panel-margin-right":0,"gpu-header-icon-size":18,"processor-source-cpu-usage":"auto","sensors-header-tooltip-sensor3-digits":-1,"sensors-header-icon":false,"memory-header-value-figures":3,"processor-header-graph-color2":"rgba(214,29,29,1.0)","compact-mode":false,"panel-box-order":0,"compact-mode-compact-icon-custom":"","network-header-graph-width":30,"gpu-header-tooltip":true,"sensors-header-icon-alert-color":"rgba(235, 64, 52, 1)","gpu-header-activity-percentage-icon-alert-threshold":0,"sensors-header-sensor2-digits":-1,"sensors-header-tooltip-sensor2-name":"","sensors-update":3,"gpu-header-tooltip-memory-value":true,"processor-header-bars":false,"gpu-header-memory-bar-color1":"rgba(29,172,214,1.0)","gpu-header-tooltip-memory-percentage":true,"sensors-header-tooltip-sensor1":"{\\"service\\":\\"hwmon\\",\\"path\\":[\\"BAT0\\",\\"in0\\",\\"input\\"]}\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\n\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\n\\\\\\\\\\\\\\\\n\\\\\\\\n\\\\n\\n","sensors-header-tooltip-sensor1-digits":-1,"storage-header-free-figures":3,"processor-header-percentage-core":false,"storage-main":"name-vg-nixos","network-source-network-io":"auto","memory-header-bars":true,"processor-header-percentage":false,"sensors-header-icon-color":"","storage-header-io-threshold":0,"memory-header-graph-color1":"rgba(29,172,214,1.0)","compact-mode-activation":"both","storage-header-icon-size":18,"sensors-header-tooltip-sensor1-name":"","sensors-header-icon-size":18,"sensors-source":"hwmon","explicit-zero":false,"storage-header-percentage-icon-alert-threshold":0,"storage-header-tooltip-io":true,"sensors-header-tooltip-sensor2":"{\\"service\\":\\"hwmon\\",\\"path\\":[\\"nvme-{$10000e100}\\",\\"Composite\\",\\"input\\"]}\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\n\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\n\\\\\\\\\\\\\\\\n\\\\\\\\n\\\\n\\n","compact-mode-expanded-icon-custom":"","memory-header-graph-color2":"rgba(29,172,214,0.3)","processor-header-icon-alert-color":"rgba(235, 64, 52, 1)","processor-header-tooltip-percentage":true,"gpu-header-show":false,"network-update":2,"sensors-header-tooltip-sensor3":"\\"\\"","storage-header-free-icon-alert-threshold":0,"memory-header-icon-custom":"","sensors-header-tooltip-sensor4":"\\"\\"","storage-header-percentage":false,"sensors-temperature-unit":"celsius","storage-header-icon-alert-color":"rgba(235, 64, 52, 1)","storage-menu-arrow-color2":"rgba(214,29,29,1.0)","memory-source-top-processes":"auto","storage-header-value-figures":3,"storage-header-io-bars-color1":"rgba(29,172,214,1.0)","storage-menu-arrow-color1":"rgba(29,172,214,1.0)","processor-header-graph-width":29,"network-header-icon-custom":"","gpu-header-tooltip-activity-percentage":true,"network-header-icon":false,"sensors-header-sensor2-layout":"vertical","sensors-header-tooltip-sensor5":"\\"\\"","memory-header-bars-breakdown":true,"sensors-header-show":false,"sensors-header-tooltip":false,"storage-update":3,"processor-header-bars-core":true,"storage-indicators-order":"[\\"icon\\",\\"bar\\",\\"percentage\\",\\"value\\",\\"free\\",\\"IO bar\\",\\"IO graph\\",\\"IO speed\\"]","processor-menu-bars-breakdown":true,"storage-header-io-bars-color2":"rgba(214,29,29,1.0)","network-io-unit":"kB/s","storage-header-icon":true,"gpu-header-activity-graph-color1":"rgba(29,172,214,1.0)","memory-unit":"kB-kiB","processor-menu-core-bars-breakdown":true,"sensors-header-sensor2-show":false,"network-header-tooltip":false,"storage-header-tooltip-free":true,"storage-header-bars-color1":"rgba(29,172,214,1.0)","theme-style":"dark","storage-source-storage-usage":"auto","network-header-io":true,"memory-header-tooltip-percentage":true,"memory-indicators-order":"[\\"icon\\",\\"bar\\",\\"graph\\",\\"percentage\\",\\"value\\",\\"free\\"]","memory-source-memory-usage":"auto","memory-header-graph-breakdown":false,"memory-header-tooltip-value":true,"memory-menu-graph-breakdown":true,"sensors-indicators-order":"[\\"icon\\",\\"value\\"]","compact-mode-start-expanded":false,"startup-delay":2,"memory-header-percentage-icon-alert-threshold":0,"sensors-header-sensor1-show":true,"network-ignored-regex":"","memory-header-value":false,"memory-header-bars-color1":"rgba(29,172,214,1.0)","network-header-io-graph-color1":"rgba(29,172,214,1.0)","gpu-header-memory-bar":true,"memory-used":"total-free-buffers-cached","gpu-header-memory-graph-width":30,"gpu-header-memory-graph":false,"headers-font-family":"System-ui","memory-header-icon":true,"network-header-io-graph-color2":"rgba(214,29,29,1.0)","memory-header-bars-color2":"rgba(29,172,214,0.3)","processor-gpu":true,"network-header-icon-color":"","storage-header-value":false,"gpu-header-icon-alert-color":"rgba(235, 64, 52, 1)","processor-header-icon":false,"headers-font-size":11,"network-header-io-figures":2,"network-header-show":true,"storage-header-tooltip":true,"network-header-io-bars-color1":"rgba(29,172,214,1.0)","processor-update":2,"network-source-wireless":"auto","processor-indicators-order":"[\\"icon\\",\\"bar\\",\\"graph\\",\\"percentage\\"]","storage-header-icon-custom":"","gpu-header-activity-bar":true,"gpu-header-activity-bar-color1":"rgba(29,172,214,1.0)","shell-bar-position":"top","network-ignored":"\\"[]\\"","network-header-io-bars-color2":"rgba(214,29,29,1.0)","memory-header-icon-color":"","sensors-header-sensor1-digits":-1,"storage-header-io-layout":"vertical","memory-header-icon-size":18,"network-header-io-threshold":0,"storage-header-show":false,"sensors-header-tooltip-sensor4-digits":-1,"processor-header-percentage-icon-alert-threshold":0,"memory-header-tooltip":true,"headers-height-override":0,"memory-header-graph":false,"network-header-icon-size":18,"gpu-header-icon-color":"","memory-header-free-figures":3,"storage-header-io-bars":false,"processor-header-bars-breakdown":true,"gpu-header-activity-graph":false,"storage-ignored":"\\"[]\\"","memory-header-icon-alert-color":"rgba(235, 64, 52, 1)","storage-header-free":false,"processor-header-icon-custom":"","gpu-header-memory-percentage":false,"processor-header-tooltip-percentage-core":false,"processor-source-cpu-cores-usage":"auto","processor-source-top-processes":"auto","processor-header-icon-color":"","sensors-header-tooltip-sensor5-name":"","gpu-header-activity-graph-width":30,"gpu-header-activity-percentage":false,"gpu-indicators-order":"[\\"icon\\",\\"activity bar\\",\\"activity graph\\",\\"activity percentage\\",\\"memory bar\\",\\"memory graph\\",\\"memory percentage\\",\\"memory value\\"]","processor-header-bars-color1":"rgba(29,172,214,1.0)","gpu-update":1.5,"gpu-header-memory-percentage-icon-alert-threshold":0,"network-header-io-layout":"vertical","processor-header-show":true,"storage-header-graph":false,"memory-header-free-icon-alert-threshold":0,"storage-ignored-regex":"","storage-menu-device-color":"rgba(29,172,214,1.0)","storage-header-tooltip-percentage":true,"memory-header-free":false,"storage-source-top-processes":"auto"}}
      '';
      queued-pref-category = "processors";
      sensors-header-icon = false;
      sensors-header-sensor1 = ''
        {"service":"hwmon","path":["coretemp","Core 8","input"]}\n
      '';
      sensors-header-sensor1-digits = -1;
      sensors-header-sensor1-show = true;
      sensors-header-show = false;
      sensors-header-tooltip = false;
      sensors-header-tooltip-sensor1 = ''
        {"service":"hwmon","path":["BAT0","in0","input"]}\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\n\\\\\\\\\\\\\\\\n\\\\\\\\n\\\\n\\n\n
      '';
      sensors-header-tooltip-sensor2 = ''
        {"service":"hwmon","path":["nvme-{$10000e100}","Composite","input"]}\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\n\\\\\\\\\\\\\\\\n\\\\\\\\n\\\\n\\n\n
      '';
      sensors-indicators-order = "[\"icon\",\"value\"]";
      sensors-source = "hwmon";
      shell-bar-position = "top";
      storage-header-show = false;
      storage-indicators-order = "[\"icon\",\"bar\",\"percentage\",\"value\",\"free\",\"IO bar\",\"IO graph\",\"IO speed\"]";
      storage-main = "name-vg-nixos";
    };

    "org/gnome/shell/extensions/azwallpaper" = {
      slideshow-current-wallpapper = "city.jpg";
      slideshow-directory = "${user-homedir}/.local/share/wallpapers";
      slideshow-slide-duration = mkTuple [1 0 0];
      slideshow-timer-remaining = 3600;
      slideshow-wallpaper-queue = ["\34183\23572\33673\29305\&1.png" "deer.jpg" "\20113\38544\32321\26143\&2.png" "\24052\23665\22812\38632.png"];
    };

    "org/gnome/shell/extensions/blur-my-shell" = {
      brightness = 0.79;
      hacks-level = 1;
      noise-amount = 0.57;
      noise-lightness = 1.01;
      settings-version = 2;
    };

    "org/gnome/shell/extensions/blur-my-shell/appfolder" = {
      brightness = 0.8;
      sigma = 30;
    };

    "org/gnome/shell/extensions/blur-my-shell/applications" = {
      blur = true;
      blur-on-overview = false;
      brightness = 0.7;
      dynamic-opacity = false;
      enable-all = false;
      opacity = 255;
      sigma = 60;
      whitelist = ["Alacritty" "org.wezfurlong.wezterm" "com.mitchellh.ghostty"];
    };

    "org/gnome/shell/extensions/blur-my-shell/dash-to-dock" = {
      blur = true;
      brightness = 0.47;
      corner-radius = 16;
      override-background = false;
      pipeline = "pipeline_default_rounded";
      sigma = 30;
      static-blur = true;
      style-dash-to-dock = 0;
      unblur-in-overview = false;
    };

    "org/gnome/shell/extensions/blur-my-shell/lockscreen" = {
      pipeline = "pipeline_default";
    };

    "org/gnome/shell/extensions/blur-my-shell/overview" = {
      pipeline = "pipeline_default";
      style-components = 2;
    };

    "org/gnome/shell/extensions/blur-my-shell/panel" = {
      brightness = 0.79;
      pipeline = "pipeline_default";
      sigma = 30;
    };

    "org/gnome/shell/extensions/blur-my-shell/screenshot" = {
      pipeline = "pipeline_default";
    };

    "org/gnome/shell/extensions/blur-my-shell/window-list" = {
      brightness = 1.0;
      sigma = 30;
    };

    "org/gnome/shell/extensions/caffeine" = lib.mkDefault {
      indicator-position-max = 2;
      toggle-state = false;
    };

    "org/gnome/shell/extensions/color-picker" = {
      color-history = [(mkUint32 2368548) 3507428];
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

    "org/gnome/shell/extensions/status-area-horizontal-spacing" = {
      hpadding = 1;
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
      name = "Orchis-dark";
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

    "org/gnome/simple-scan" = {
      document-type = "photo";
    };

    "org/gnome/system/location" = {
      enabled = true;
    };

    "org/gnome/tweaks" = {
      show-extensions-notice = false;
    };

    "org/gtk/gtk4/settings/file-chooser" = {
      date-format = "regular";
      location-mode = "filename-entry";
      show-hidden = false;
      show-size-column = true;
      show-type-column = true;
      sidebar-width = 140;
      sort-column = "name";
      sort-directories-first = true;
      sort-order = "ascending";
      type-format = "category";
      view-type = "grid";
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
    };
  };
}
