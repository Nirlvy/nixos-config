{ self, ... }:
{
  imports = [
    ./base
    ./programs
    (import "${self}/modules/desktop/default.nix").wm
  ];

  programs.niri.enable = true;
}
