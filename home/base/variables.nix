{
  config,
  lib,
  ...
}: let
  d = config.xdg.dataHome;
  c = config.xdg.configHome;
  cache = config.xdg.cacheHome;
in {
  home.sessionVariables = {
    LANG = "zh_CN.UTF-8";

    GTK2_RC_FILES = lib.mkForce (c + "/gtk-2.0/.gtkrc-2.0");

    WINEPREFIX = d + "/wine";
    BROWSER = "firefox";
  };
}
