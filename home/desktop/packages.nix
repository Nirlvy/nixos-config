{
  inputs,
  pkgs,
  ...
}: {
  home = {
    packages = with pkgs; [
      mako
      wofi

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
      wechat-uos

      firefox
      vscode
      # vscode crashbin need it
      glib

      qjournalctl
      filelight
      telegram-desktop
      jetbrains-toolbox
      obsidian
      obs-studio

      inputs.nix-gaming.packages.${system}.wine-ge
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
