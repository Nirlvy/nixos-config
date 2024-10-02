{ inputs, pkgs, ... }:
{
  programs.wezterm = {
    enable = true;
    package = inputs.wezterm.packages.${pkgs.system}.default;
    extraConfig = ''
      local config = {}

      config.color_scheme = "Catppuccin Frappe"
      config.window_background_opacity = 0.8
      config.window_decorations = "RESIZE"  

      config.font = wezterm.font("JetBrainsMono Nerd Font")
      config.font_size = 10

      config.enable_scroll_bar = true

      config.hide_tab_bar_if_only_one_tab = true
      config.use_fancy_tab_bar = false
      config.switch_to_last_active_tab_when_closing_tab = true
      config.adjust_window_size_when_changing_font_size = false

      config.enable_wayland = true
      -- config.front_end = "WebGpu"

      return config
    '';
  };
}
