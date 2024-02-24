{ pkgs, ... }:

{

  home.file.".config" = {
    source = ./conf;
    recursive = true;
    executable = true;
  };

  home.file.".wayland-session" = {
    source = "${pkgs.hyprland}/bin/Hyprland";
    executable = true;
  };

  wayland.windowManager.hyprland = {
    enable = true;
    enableNvidiaPatches = false;

    extraConfig = builtins.readFile ./hyprland.conf;
  };

  home = {

    pointerCursor = {
      gtk.enable = true;
      package = pkgs.capitaine-cursors;
      name = "capitaine-cursors-light";
      size = 24;
    };

    packages = with pkgs;[

      mako
      wofi
      waybar
      qt5ct

      mpd
      mpc-cli
      cantata

      swayidle
      sway-audio-idle-inhibit
      swaylock-effects

      cliphist
      grim
      slurp
      swappy
      wl-clipboard

      hyprpaper
      hyprpicker

      lxqt.lximage-qt
      gnome.nautilus
      xarchiver

      lxappearance

    ];

  };

  gtk = {
    enable = true;
    theme = {
      package = pkgs.arc-theme;
      name = "Arc-Dark";
    };
    iconTheme = {
      package = pkgs.tela-icon-theme;
      name = "Tela";
    };
  };

  qt = {
    enable = true;
    platformTheme = "qtct";
  };

}
