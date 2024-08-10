{ pkgs, ... }:
{
  imports = [

    ../../tools
    ../waybar
    ../wofi

    ../packages.nix
    ../theme.nix
  ];

  xdg.configFile."hypr" = {
    source = ./hypr;
    recursive = true;
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
