{ config, pkgs, ... }:
{
  home.pointerCursor = {
    gtk.enable = true;
    package = pkgs.capitaine-cursors;
    name = "capitaine-cursors-white";
    size = 24;
  };

  gtk = {
    enable = true;
    gtk2 = {
      configLocation = "${config.xdg.configHome}/gtk-2.0/gtkrc";
      extraConfig = ''gtk-im-module="fcitx"'';
    };
    gtk3.extraConfig = {
      gtk-im-module = ''fcitx'';
    };
    gtk4.extraConfig = {
      gtk-im-module = ''fcitx'';
    };
    theme = {
      name = "catppuccin-frappe-sky-standard";
      package = pkgs.catppuccin-gtk;
    };
    iconTheme = {
      package = pkgs.tela-icon-theme;
      name = "Tela";
    };
  };

  systemd.user.sessionVariables = {
    QT_QPA_PLATFORMTHEME = "gtk3";
  };
  qt = {
    enable = false;
    platformTheme.name = "qtct";
  };

  # Catppuccin theme
  xdg.configFile = {
    # "qt5ct/colors/".source = "${pkgs.catppuccin-qt5ct}/share/qt5ct/colors";
    "gtk-4.0/assets".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/assets";
    "gtk-4.0/gtk.css".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/gtk.css";
    "gtk-4.0/gtk-dark.css".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/gtk-dark.css";
  };
}
