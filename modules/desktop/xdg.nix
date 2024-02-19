{ pkgs, ... }:

{
  xdg.portal = {
    enable = true;

    config = {
      common = {
        default = [
          "gtk"
        ];
        "org.freedesktop.impl.portal.Secret" = [
          "gnome-keyring"
        ];
      };
    };

    xdgOpenUsePortal = true;

    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
    ];

  };
}
