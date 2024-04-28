{
  config,
  lib,
  pkgs,
  ...
}: {
  programs.alacritty = {
    enable = true;
    settings = {
      colors = {
        bright = {
          black = "#444444";
          blue = "#61afef";
          cyan = "#67fff0";
          green = "#abe15b";
          magenta = "#fc1a70";
          red = "#ff2740";
          white = "#eaeaea";
          yellow = "#ffd242";
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
          white = "#eaeaea";
          yellow = "#f4bf75";
        };
        primary = {
          background = "#121212";
          foreground = "#eaeaea";
        };
        selection = {
          background = "#404040";
          text = "#eaeaea";
        };
      };
      cursor = {
        style = "Never";
      };
      env = {
        TERM = "xterm-256color";
      };
      font = {
        size = 12;
        bold = {
          family = "JetBrains Mono";
          style = "Bold";
        };
        bold_italic = {
          family = "JetBrains Mono";
          style = "Bold Italic";
        };
        italic = {
          family = "Operator Mono Book";
          style = "Italic";
        };
        normal = {
          family = "JetBrains Mono";
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
        opacity = 0.78;
        decorations = "None";
      };
      mouse = {
        hide_when_typing = false;
      };
    };
  };
}
