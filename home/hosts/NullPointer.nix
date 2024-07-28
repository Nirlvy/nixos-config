{ inputs, ... }:
{
  imports = [
    ../.

    ../base/editor.nix
    ../base/dev.nix
    ../base/git.nix
    ../base/misc.nix
    ../base/shell.nix
    ../base/variables.nix

    ../desktop
    ../desktop/wm/hyprland

    inputs.nix-index-database.hmModules.nix-index
  ];
}
