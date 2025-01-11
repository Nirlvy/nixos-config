{
  inputs,
  pkgs,
  self,
  ...
}:
{
  imports = [
    inputs.niri.nixosModules.niri

    ./base
    ./programs
    (import "${self}/modules/desktop/default.nix").wm
  ];
  # for garnix skip build
  # nixpkgs.overlays = [ inputs.niri.overlays.niri ];

  programs.niri = {
    enable = true;
    package = pkgs.niri;
  };

  xdg.portal = {
    extraPortals = [ pkgs.xdg-desktop-portal-gnome ];
    configPackages = [ pkgs.niri ];
  };

  systemd.user.services.niri-flake-polkit.enable = false;
}
