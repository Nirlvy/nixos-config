{
  programs.wezterm = {
    enable = true;
    extraConfig = ''
      local wezterm = require 'wezterm'
      local config = {}

      config.color_scheme = 'Catppuccin Frappe'
      config.window_background_opacity = 0.8

      return config
    '';
  };
}
