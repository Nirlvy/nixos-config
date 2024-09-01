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
    enable = false;
    package = pkgs.niri-unstable;
  };
}
