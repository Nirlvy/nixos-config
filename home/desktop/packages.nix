{ pkgs, ... }:
{
  home.packages = with pkgs; [
    baobab
    ristretto

    qq
    wpsoffice-cn

    # jetbrains.rust-rover
    jetbrains.pycharm

    telegram-desktop
    obsidian
    # obs-studio
    vscode
    trash-cli
    zed-editor

    # qjournalctl
  ];
}
