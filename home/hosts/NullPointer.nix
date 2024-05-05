{inputs, ...}: {
  imports = [
    ../.

    ../base/editor.nix
    ../base/git.nix
    ../base/misc.nix
    ../base/packages.nix
    ../base/shell.nix
    ../base/variables.nix

    ../desktop/alacritty.nix
    ../desktop/xdg.nix
    ../desktop/packages.nix

    ../desktop/hyprland
    ../desktop/tools

    inputs.nix-index-database.hmModules.nix-index
  ];
}
