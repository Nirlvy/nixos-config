{config, ...}: let
  d = config.xdg.dataHome;
  c = config.xdg.configHome;
  cache = config.xdg.cacheHome;
in {
  home.sessionVariables = {
    LANG = "zh_CN.UTF-8";

    WINEPREFIX = d + "/wine";
    BROWSER = "firefox";
  };
}
