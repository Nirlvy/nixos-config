{ pkgs, ... }:
{
  home.packages = with pkgs; [
    lxqt.lximage-qt

    qq

    telegram-desktop
    obsidian
    obs-studio
    vscode
    zed-editor

    qjournalctl
    filelight

    winetricks
    wineWowPackages.wayland
  ];
}
