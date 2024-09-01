{ inputs, pkgs, ... }:
{
  imports = [
    inputs.niri.homeModules.niri
    ../.
  ];

  programs.niri = {
    enable = true;
    package = pkgs.niri-unstable;
    config = builtins.readFile ./config.kdl;
  };
}
