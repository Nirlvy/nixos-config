{ inputs, pkgs, ... }:
{
  imports = [
    ./fcitx5.nix
    ./fonts.nix
    ./media.nix
    ./sddm.nix
    ./security.nix
    ./services.nix
    ./thunar.nix
    ./virtualization.nix
  ];

  programs = {
    hyprland = {
      enable = true;
      package = inputs.hyprland.packages.${pkgs.system}.hyprland;
    };
    light.enable = true;
  };

  # environment.variables.NIXOS_OZONE_WL = "1";

  xdg.portal = {
    enable = true;

    config = {
      common = {
        default = [ "gtk" ];
        "org.freedesktop.impl.portal.Secret" = [ "gnome-keyring" ];
      };
      hyprland.default = [
        "gtk"
        "hyprland"
      ];
    };

    extraPortals = with pkgs; [ xdg-desktop-portal-gtk ];
  };
}
