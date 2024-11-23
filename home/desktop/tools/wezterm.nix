{ inputs, pkgs, ... }:
{
  programs.wezterm = {
    enable = true;
    package = inputs.wezterm.packages.${pkgs.system}.default;
    extraConfig = ''
      local w = require("wezterm")
      local config = w.config_builder()

      config.color_scheme = "Catppuccin Frappe"
      config.window_background_opacity = 0.8
      config.window_decorations = "RESIZE"
      config.adjust_window_size_when_changing_font_size = false  

      config.font = w.font("JetBrainsMono Nerd Font")
      config.font_size = 10

      default_cursor_style = "SteadyBlock"

      config.enable_scroll_bar = true

      config.hide_tab_bar_if_only_one_tab = true
      config.use_fancy_tab_bar = false
      config.switch_to_last_active_tab_when_closing_tab = true

      return config
    '';
  };
}
