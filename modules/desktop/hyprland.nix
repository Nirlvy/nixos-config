{ inputs, pkgs, ... }:

{

  imports = [
    ./fonts.nix
    ./media.nix
    ./dm
    ./security.nix
    ./virtualization.nix
  ];

  programs.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
  };

  programs.nautilus-open-any-terminal = {
    enable = true;
    terminal = "alacritty";
  };

  services.gvfs.enable = true;

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
