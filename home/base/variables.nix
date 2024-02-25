{ config, ... }:

let
  d = config.xdg.dataHome;
  c = config.xdg.configHome;
  cache = config.xdg.cacheHome;
in

rec {

  home.sessionVariables = {

    WINEPREFIX = d + "/wine";
    BROWSER = "microsoft-edge";
    LANG = "zh_CN.UTF-8";

  };
}
