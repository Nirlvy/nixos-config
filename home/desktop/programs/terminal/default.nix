{
  imports = [
    ./alacritty.nix
    ./ghostty.nix
    ./kitty.nix
    # ./wezterm.nix
  ];

  home.sessionVariables = {
    TERMINAL = "ghostty";
  };
}