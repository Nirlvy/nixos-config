{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # lxqt.lximage-qt

    qq

    telegram-desktop
    obsidian
    obs-studio
    vscode-fhs
    zed-editor

    distrobox
    qjournalctl
    filelight

    winetricks
    wineWowPackages.wayland
  ];
}
