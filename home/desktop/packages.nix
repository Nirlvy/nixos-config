{ pkgs, ... }:
{
  home = {
    packages = with pkgs; [
      lxqt.lximage-qt

      qq
      wechat-uos

      telegram-desktop
      obsidian
      obs-studio
      vscode

      qjournalctl
      filelight

      winetricks
      wineWowPackages.wayland
      bottles
    ];
  };
}
