{ pkgs, ... }:
{
  imports = [
    ../.
  ];

  programs.niri.config = builtins.readFile ./config.kdl;

  home.packages = [
    pkgs.xwayland-satellite
  ];
}
