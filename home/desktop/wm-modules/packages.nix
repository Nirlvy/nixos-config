{ pkgs, ... }:
{
  home.packages = with pkgs; [
    alsa-utils
    pavucontrol

    cliphist
    # mako
    wl-clipboard
    wl-shot-edit
    wlogout

    hyprpaper
    hypridle
    hyprlock
  ];
}
