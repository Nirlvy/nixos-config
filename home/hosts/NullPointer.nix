{ inputs, ... }:
{
  imports = [
    ../.

    ../base
    ../desktop/wm/hyprland

    inputs.nix-index-database.hmModules.nix-index
  ];
}
