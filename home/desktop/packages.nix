{
  nix-gaming,
  pkgs,
  ...
}: {
  home = {
    packages = with pkgs; [
      mako
      wofi
      waybar

      alsa-utils
      pavucontrol

      # mpd
      # mpc-cli
      # cantata

      cliphist
      grim
      slurp
      swappy
      wl-clipboard

      hyprpaper
      hyprpicker
      hypridle
      hyprlock

      lxqt.lximage-qt

      catppuccin-qt5ct

      qq
      # wechat-uos

      firefox
      (vscode.override
        {
          commandLineArgs = ''
            --enable-features=WaylandWindowDecorations
            --ozone-platform=wayland
            --enable-wayland-ime
          '';
        })
      # vscode crashbin need it
      glib

      qjournalctl
      filelight
      telegram-desktop
      jetbrains-toolbox
      obsidian
      obs-studio

      nix-gaming.packages.${pkgs.system}.wine-ge
      winetricks
      winePackages.fonts
    ];
  };

  programs.mpv = {
    enable = true;
    scripts = with pkgs.mpvScripts; [
      thumbfast
      modernx-zydezu
    ];
    config = {
      osc = "no";
      border = "no"; #optional - if you don't want to see the OS border
    };
  };
}
