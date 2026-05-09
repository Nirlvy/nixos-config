{ ... }:
{
  imports = [
    # ./waybar
    # ./swaync
    ./noctalia.nix

    # ./fuzzel.nix
    ./packages.nix
    ./systemed-sevices.nix
    ./theme.nix
    ./wayland-pipewire-idle-inhibit.nix
  ];

  home.file."Pictures/pic".source = ./pic;

  # xdg.configFile."hypr" = {
  #   source = ./hypr;
  #   recursive = true;
  # };
}
