{ config, ... }:
let
  target =
    if config.wayland.windowManager.hyprland.enable then
      ''target = "hyprland-session.target"''
    else
      ''target = "graphical-session.target"'';
in
{
  programs.waybar = {
    enable = true;
    systemd = {
      enable = true;
      inherit target;
    };
    style = ./style.css;
  };

  xdg.configFile = {
    "waybar/config".source = ./config;
  };
}
