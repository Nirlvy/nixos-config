{ inputs, pkgs, ... }:

{

  imports = [
    ./fonts.nix
    ./media.nix
    ./dm
    # ./security.nix
    # ./virtualization.nix
  ];

  programs.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
  };

}
