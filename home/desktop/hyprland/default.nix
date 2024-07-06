{ pkgs, ... }:
{
  home.file.".config" = {
    source = ./conf;
    recursive = true;
    executable = true;
  };

  home.file.".wayland-session" = {
    source = "${pkgs.hyprland}/bin/Hyprland";
    executable = true;
  };

  wayland.windowManager.hyprland = {
    enable = true;
    extraConfig = builtins.readFile ./hyprland.conf;
  };

}
