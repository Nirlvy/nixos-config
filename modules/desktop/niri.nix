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

  nix.settings = {
    substituters = [ "https://niri.cachix.org" ];
    trusted-public-keys = [ "niri.cachix.org-1:Wv0OmO7PsuocRKzfDoJ3mulSl7Z6oezYhGhR+3W2964=" ];
  };

  nixpkgs.overlays = [ inputs.niri.overlays.niri ];

  programs.niri = {
    enable = true;
    package = pkgs.niri;
  };
}
