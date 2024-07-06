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

    ../desktop/alacritty.nix
    ../desktop/dev.nix
    ../desktop/packages.nix
    ../desktop/wm.nix
    ../desktop/xdg.nix

    ../desktop/hyprland
    ../desktop/tools

    inputs.nix-index-database.hmModules.nix-index
  ];
}
