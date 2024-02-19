{ pkgs, ... }:

{

  home.file.".config" = {
    source = ./conf;
    recursive = true;
    executable = true;
  };

  wayland.windowManager.hyprland = {
    enable = true;
    enableNvidiaPatches = false;
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

      mtpfs
      linuxKernel.packages.linux_xanmod_stable.v4l2loopback

      hyprpaper
      hyprpicker

      lxqt.lximage-qt
      mpv
      gnome.nautilus
      tlp
      typora
      xarchiver

    ];
    
  };

  # programs.nautilus-open-any-terminal = {
  #   enable = true;
  #   terminal = "alacritty";
  # };  

  # gtk = {

  #   enable = true;
  #   theme = {
  #     package = pkgs.arc-theme;
  #     name = "arc-theme-dark";
  #   };
  #   iconTheme = {
  #     package = pkgs.tela-icon-theme;
  #     name = "tela-icon-theme";
  #   };

  # };

}
