{ pkgs, ... }:
{
  home.packages = with pkgs; [
    alsa-utils
    pavucontrol
    pwvucontrol

    cliphist
    grim
    mako
    slurp
    swappy
    wl-clipboard

    hyprpaper
    hyprpicker
    hypridle
    hyprlock
  ];
}
