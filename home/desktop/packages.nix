{pkgs, ...}: {
  home.packages = with pkgs; [
    tlp
    mtpfs

    mpv
    vlc

    qq
    microsoft-edge
    firefox
    typora
    vscode
    qjournalctl
    filelight
    telegram-desktop
    jetbrains-toolbox
    obsidian
    xarchiver

    winetricks
    xwaylandvideobridge
  ];

  programs.obs-studio = {
    enable = true;
  };

}
