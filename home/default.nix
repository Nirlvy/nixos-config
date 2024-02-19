{ config, ... }:

{

  imports = [
    ./git.nix
    ./packages.nix
    ./zsh
    ./alacritty
    ./hyprland
  ];

  home = {
    username = "nirlvy";
    homeDirectory = "/home/nirlvy";

    stateVersion = "23.11";
  };

  programs.home-manager.enable = true;

}
