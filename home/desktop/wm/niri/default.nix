{ pkgs, ... }:
{
  imports = [ ../. ];

  xdg.configFile."niri/config.kdl".source = ./config.kdl;

  home.packages = [ pkgs.xwayland-satellite-unstable ];
}
