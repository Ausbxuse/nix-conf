{
  lib,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    ueberzugpp
  ];
  programs.alacritty = {
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
          cursor = "#dfdcd8";
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
        size = 11;
        bold = {
          family = "JetBrainsMono Nerd Font";
          style = "Bold";
        };
        bold_italic = {
          family = "JetBrainsMono Nerd Font";
          style = "Bold Italic";
        };
        italic = {
          family = "Operator Mono Book";
          style = "Italic";
        };
        normal = {
          family = "JetBrainsMono Nerd Font";
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
        ];
      };
      scrolling = {
        history = 10000;
        multiplier = 1;
      };
      window = {
        dynamic_padding = true;
        opacity = 0.57;
        decorations = "None";
      };
      mouse = {
        hide_when_typing = false;
      };
    };
  };

  # home.activation.cleanFontCache = lib.hm.dag.entryAfter ["writeBoundary"] ''
  #   ${pkgs.fontconfig}/bin/fc-cache -vr
  # '';
}
