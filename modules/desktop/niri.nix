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
  nixpkgs.overlays = [ inputs.niri.overlays.niri ];

  programs.niri = {
    enable = true;
    package = pkgs.niri-unstable;
  };

  xdg.portal = {
    extraPortals = [ pkgs.xdg-desktop-portal-gnome ];
    configPackages = [ pkgs.niri-unstable ];
  };
}
