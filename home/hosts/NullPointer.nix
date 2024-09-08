{ inputs, ... }:
{
  imports = [
    ../.

    ../base
    # ../desktop/wm/hyprland
    ../desktop/wm/niri

    inputs.nix-index-database.hmModules.nix-index
  ];
}
