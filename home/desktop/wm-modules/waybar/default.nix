{
  programs.waybar = {
    enable = true;
    systemd.enable = true;
    style = ./style.css;
  };

  xdg.configFile = {
    "waybar/config".source = ./config;
  };
}
