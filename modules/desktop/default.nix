let
  de = {
    imports = [
      ./base
      ./programs
    ];

    # for electron apps use gtk input method
    # environment.variables.NIXOS_OZONE_WL = "1";
  };
  wm =
    { pkgs, ... }:
    {
      imports = [ de ];
      programs.light.enable = true;

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
          niri.default = [
            "gtk"
            "gnome"
          ];
        };
        extraPortals = with pkgs; [ xdg-desktop-portal-gtk ];
      };
    };
in
{
  inherit de wm;
}
