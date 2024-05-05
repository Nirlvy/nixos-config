{pkgs, ...}: {
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
      envVars.enable = false;
    };
    light.enable = true;
  };

  # environment.variables.NIXOS_OZONE_WL = "1";

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
