{
  inputs,
  pkgs,
  self,
  ...
}:
{
  imports = [
    ./base
    ./programs
    (import "${self}/modules/desktop/default.nix").wm
  ];

  programs = {
    hyprland = {
      enable = true;
      package = inputs.hyprland.packages.${pkgs.system}.hyprland;
    };
    light.enable = true;
  };

  environment.variables.NIXOS_OZONE_WL = "1";

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
