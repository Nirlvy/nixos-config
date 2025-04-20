{ pkgs, ... }:
{
  home.packages = with pkgs; [
    baobab
    xfce.ristretto

    qq
    wpsoffice

    jetbrains.rust-rover

    telegram-desktop
    obsidian
    obs-studio
    vscode
    trash-cli # for vscode trash (now broken again)
    zed-editor

    qjournalctl
  ];
}
