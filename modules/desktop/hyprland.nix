{
  inputs,
  pkgs,
  self,
  ...
}:
{
  imports = [
    ./base
    ./programs
    (import "${self}/modules/desktop/default.nix").wm
  ];

  programs = {
    hyprland = {
      enable = true;
      package = inputs.hyprland.packages.${pkgs.system}.hyprland;
    };
  };
}
