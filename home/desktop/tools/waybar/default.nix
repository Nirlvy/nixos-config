{
  programs.waybar = {
    enable = true;
    systemd.enable = false;

    style = ./style.css;
  };

  xdg.configFile."waybar/config".source = ./config;
}
