{ pkgs, ... }:

{

  home.packages = with pkgs;[

    libsForQt5.qtstyleplugin-kvantum
    tlp
    mtpfs
    nwg-look

    mpv
    vlc

    qq
    microsoft-edge
    typora
    vscode

    wineWowPackages.waylandFull
    wineWowPackages.fonts
    winetricks
    dxvk
    mono
    geckodriver

    # nur.repos.xddxdd.wechat-uos-bin
    # nur.repos.xddxdd.wine-wechat

  ];

  programs.obs-studio = {
    enable = true;
    plugins = with pkgs; [
      linuxKernel.packages.linux_xanmod_stable.v4l2loopback
    ];
  };

}
