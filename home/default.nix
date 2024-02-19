{ config, ... }:

let
  isHyprland = if (config.home.username == "vmware-hyprland") then [ ./hyprland ] else [];
in

{

  imports = [
    ./git.nix
    ./packages.nix
    ./zsh
    ./alacritty
  ] ++ isHyprland;

  home = {
    username = "nirlvy";
    homeDirectory = "/home/nirlvy";

    stateVersion = "23.11";
  };

  programs.home-manager.enable = true;

}
