{
  imports = [
    ./base/editor.nix
    ./base/git.nix
    ./base/misc.nix
    ./base/packages.nix
    ./base/shell.nix
    ./base/variables.nix

    ./desktop/alacritty.nix
    ./desktop/fcitx5.nix
    ./desktop/xdg.nix
    ./desktop/packages.nix

    ./desktop/hyprland
  ];

  home = {
    username = "nirlvy";
    homeDirectory = "/home/nirlvy";

    stateVersion = "23.11";
  };

  programs.home-manager.enable = true;
}
