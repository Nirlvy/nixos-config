{
  inputs,
  pkgs,
  self,
  ...
}:
let
  niri = inputs.niri.packages.${pkgs.system}.niri;
in
{
  imports = [
    ./base
    ./programs
    (import "${self}/modules/desktop/default.nix").wm
  ];

  programs.niri = {
    enable = true;
    package = niri;
  };
}
