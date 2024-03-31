{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    ./fonts.nix
    ./media.nix
    ./dm
    ./security.nix
    ./virtualization.nix
  ];

  programs = {
    hyprland = {
      enable = true;
      package = inputs.hyprland.packages.${pkgs.system}.hyprland;
    };

    light.enable = true;

    thunar = {
      enable = true;
      plugins = with pkgs.xfce; [
        thunar-volman
        thunar-archive-plugin
        thunar-media-tags-plugin
      ];
    };

    # for thunar saving changes
    xfconf.enable = true;
  };

  environment.variables.NIXOS_OZONE_WL = "1";

  # for thunar
  services.gvfs.enable = true; # Mount, trash, and other functionalities
  services.tumbler.enable = true; # Thumbnail support for images
  environment.systemPackages = [
    pkgs.xfce.exo
  ];

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

    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
    ];
  };
}
