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
    wofi

    hyprpaper
    hyprpicker
    hypridle
    hyprlock
  ];
}
