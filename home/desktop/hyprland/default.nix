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
    extraConfig = builtins.readFile ./hyprland.conf;
  };

  home = {

    packages = with pkgs;[

      mako
      wofi
      waybar
      qt5ct
      light
      alsa-utils
      pavucontrol

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

    pointerCursor = {
      gtk.enable = true;
      package = pkgs.capitaine-cursors;
      name = "capitaine-cursors-white";
      size = 24;
    };

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
