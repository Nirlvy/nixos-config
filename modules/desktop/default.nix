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
          hyprland.default = [
            "gtk"
            "hyprland"
          ];
          niri = {
            default = [
              "gnome"
              "gtk"
            ];
            "org.freedesktop.impl.portal.Access" = [ "gtk" ];
            "org.freedesktop.impl.portal.FileChooser" = [ "gtk" ];
            "org.freedesktop.impl.portal.Notification" = [ "gtk" ];
            "org.freedesktop.impl.portal.RemoteDesktop" = [ "gnome" ];
            "org.freedesktop.impl.portal.ScreenCast" = [ "gnome" ];
            "org.freedesktop.impl.portal.Screenshot" = [ "gnome" ];
            "org.freedesktop.impl.portal.Secret" = [ "gnome-keyring" ];
          };
        };
        extraPortals = with pkgs; [ xdg-desktop-portal-gtk ];
      };
    };
in
{
  inherit de wm;
}
