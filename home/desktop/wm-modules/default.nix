{
  imports = [
    ./waybar
    ./wofi

    ./packages.nix
    ./theme.nix
  ];

  xdg.configFile."hypr" = {
    source = ./hypr;
    recursive = true;
  };
}
