{pkgs, ...}: {
  programs.alacritty = {
    enable = true;

    settings = {
      env = {
        TERM = "xterm-256color";
      };
      colors = {
        primary = {
          background = "#1c1e26";
          foreground = "#e0e0e0";
        };
        normal = {
          black = "#16161c";
          blue = "#26bbd9";
          cyan = "#59e1e3";
          green = "#29d398";
          magenta = "#ee64ac";
          red = "#395678";
          white = "#d5d8da";
          yellow = "#fab795";
        };
        bright = {
          black = "#5b5858";
          blue = "#3fc4de";
          cyan = "#6be4e6";
          green = "#3fdaa4";
          magenta = "#f075b5";
          red = "#ec6a88";
          white = "#d5d8da";
          yellow = "#fbc3a7";
        };
      };
      cursor = {
        style = {
          blinking = "Always";
          shape = "Beam";
        };
      };
      font = {
        size = 10;
        normal = {
          family = "JetBrainsMono Nerd Font";
          style = "Regular";
        };
        bold = {
          family = "JetBrainsMono Nerd Font";
          style = "Bold";
        };
        bold_italic = {
          family = "JetBrainsMono Nerd Font";
          style = "Bold Italic";
        };
        italic = {
          family = "JetBrainsMono Nerd Font";
          style = "Italic";
        };
      };
      mouse = {
        hide_when_typing = true;
      };
      selection = {
        save_to_clipboard = true;
      };
      shell = {
        program = "${pkgs.zsh}/bin/zsh";
      };
      window = {
        decorations = "full";
        dynamic_padding = true;
        opacity = 0.8;
        padding = {
          x = 5;
          y = 3;
        };
      };
    };
  };
}
