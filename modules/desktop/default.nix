let
  de =
    { pkgs, ... }:
    {
      imports = [
        ./base
        ./programs
      ];

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
    };
  wm = {
    imports = [ de ];
    programs.light.enable = true;
  };
in
{
  inherit de wm;
}
