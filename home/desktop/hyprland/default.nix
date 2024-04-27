{
  config,
  pkgs,
  ...
}: {
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

  # services.mpd = {
  #   enable = true;
  #   musicDirectory = "~/Music/Music";
  #   extraConfig = builtins.readFile ./conf/mpd/mpd.conf;
  # };

  home.pointerCursor = {
    gtk.enable = true;
    package = pkgs.capitaine-cursors;
    name = "capitaine-cursors-white";
    size = 24;
  };

  gtk = {
    enable = true;
    theme = {
      name = "Catppuccin-Frappe-Standard-Sky-Dark";
      package = pkgs.catppuccin-gtk.override {
        accents = ["sky"];
      };
    };
    iconTheme = {
      package = pkgs.tela-icon-theme;
      name = "Tela";
    };
  };

  qt = {
    enable = true;
    platformTheme.name = "qtct";
  };

  # for Catppuccin GTK theme
  xdg.configFile = {
    "gtk-4.0/assets".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/assets";
    "gtk-4.0/gtk.css".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/gtk.css";
    "gtk-4.0/gtk-dark.css".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/gtk-dark.css";
  };
}
