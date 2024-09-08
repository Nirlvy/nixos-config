{
  programs.wezterm = {
    enable = true;
    extraConfig = ''
      local config = {}

      config.color_scheme = 'Catppuccin Frappe'
      config.window_background_opacity = 0.8
      config.enable_wayland = true
      config.front_end = "WebGpu"

      return config
    '';
  };
}
