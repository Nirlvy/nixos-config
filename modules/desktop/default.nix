let
  de = {
    imports = [
      ./base
      ./programs
    ];

    environment.variables.NIXOS_OZONE_WL = "1";
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
          hyprland.default = [ "hyprland" ];
          niri.default = [ "gnome" ];
        };
        extraPortals = with pkgs; [ xdg-desktop-portal-gtk ];
      };
    };
in
{
  inherit de wm;
}
