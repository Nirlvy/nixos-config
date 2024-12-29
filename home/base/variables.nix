{ config, ... }:
let
  d = config.xdg.dataHome;
in
# cfg = config.xdg.configHome;
# c = config.xdg.cacheHome;
{
  home.sessionVariables = {
    LANG = "zh_CN.UTF-8";

    WINEPREFIX = d + "/wine";
  };
}
