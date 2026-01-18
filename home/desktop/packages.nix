{ pkgs, ... }:
{
  home.packages = with pkgs; [
    baobab
    ristretto

    qq
    # wpsoffice

    # jetbrains.rust-rover
    jetbrains.pycharm

    telegram-desktop
    obsidian
    # obs-studio
    vscode
    trash-cli # for vscode trash (now broken again)
    zed-editor

    # qjournalctl
  ];
}
