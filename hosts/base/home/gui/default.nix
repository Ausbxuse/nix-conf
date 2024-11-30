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
    alacritty = {
      enable = true;
      settings = {
        colors = {
          bright = {
            black = "#444444";
            blue = "#4fc1ff";
            cyan = "#62d8f1";
            green = "#9ece6a";
            magenta = "#fc317e";
            red = "#ff2740";
            white = "#dfdcd8";
            yellow = "#f4bf75";
          };
          cursor = {
            cursor = "#eaeaea";
            text = "#000000";
          };
          dim = {
            black = "#000000";
            blue = "#506d8f";
            cyan = "#497e7a";
            green = "#7a8530";
            magenta = "#80638e";
            red = "#8c3336";
            white = "#eaeaea";
            yellow = "#97822e";
          };
          normal = {
            black = "#121212";
            blue = "#4fc1ff";
            cyan = "#62d8f1";
            green = "#9ece6a";
            magenta = "#fc317e";
            red = "#ff2740";
            white = "#dfdcd8";
            yellow = "#f4bf75";
          };
          primary = {
            background = "#121212";
            foreground = "#dfdcd8";
          };
          selection = {
            background = "#404040";
            text = "#dfdcd8";
          };
        };
        cursor = {
          style = {
            blinking = "Never";
          };
        };
        env = {
          TERM = "xterm-256color";
        };
        font = {
          size = 12;
          bold = {
            family = "JetBrainsMono NF";
            style = "Bold";
          };
          bold_italic = {
            family = "JetBrainsMono NF";
            style = "Bold Italic";
          };
          italic = {
            family = "Operator Mono Book";
            style = "Italic";
          };
          normal = {
            family = "JetBrainsMono NF";
            style = "Regular";
          };
          offset = {
            x = 0;
            y = 0;
          };
        };
        keyboard = {
          bindings = [
            {
              action = "Paste";
              key = "V";
              mods = "Command";
            }
            {
              action = "Copy";
              key = "C";
              mods = "Command";
            }
            {
              action = "PasteSelection";
              key = "Insert";
              mods = "Shift";
            }
            {
              action = "ResetFontSize";
              key = "Key0";
              mods = "Control";
            }
            {
              action = "IncreaseFontSize";
              key = "Equals";
              mods = "Control";
            }
            {
              action = "DecreaseFontSize";
              key = "Minus";
              mods = "Control";
            }
            {
              action = "ScrollPageUp";
              key = "PageUp";
              mode = "~Alt";
            }
            {
              action = "ScrollPageDown";
              key = "PageDown";
              mode = "~Alt";
            }
          ];
        };
        scrolling = {
          history = 10000;
          multiplier = 1;
        };
        window = {
          dynamic_padding = true;
          opacity = 0.70;
          decorations = "None";
        };
        mouse = {
          hide_when_typing = false;
        };
      };
    };

    wezterm = {
      enable = true;
      enableZshIntegration = false;
      enableBashIntegration = true;
      extraConfig = lib.mkDefault (builtins.readFile ./wezterm/wezterm.lua);
    };
    firefox = {
      enable = true;
      profiles.betterfox = {
        extraConfig = builtins.readFile ./user.js;
        #search.default = "Kagi";
        #search.engines = {
        #  "Nix Packages" = {
        #    urls = [
        #      {
        #        template = "https://search.nixos.org/packages";
        #        params = [
        #          {
        #            name = "type";
        #            value = "packages";
        #          }
        #          {
        #            name = "query";
        #            value = "{searchTerms}";
        #          }
        #        ];
        #      }
        #    ];

        #    icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
        #    definedAliases = ["@np"];
        #  };

        #  "NixOS Wiki" = {
        #    urls = [{template = "https://wiki.nixos.org/index.php?search={searchTerms}";}];
        #    iconUpdateURL = "https://wiki.nixos.org/favicon.png";
        #    #updateInterval = 24 * 60 * 60 * 1000; # every day
        #    definedAliases = ["@nw"];
        #  };

        #  "Kagi" = {
        #    urls = [{template = "https://kagi.com/search?q={searchTerms}";}];
        #    definedAliases = ["@kg"];
        #  };
        #};
      };
      # package = pkgs.firefox-wayland;
    };
    zathura = {
      enable = true;
      extraConfig = builtins.readFile ./zathurarc;
    };
  };
}
