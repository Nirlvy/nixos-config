{ config, ... }:
let
  d = config.xdg.dataHome;
  cfg = config.xdg.configHome;
  c = config.xdg.cacheHome;
in
{
  home.sessionVariables = {
    LANG = "zh_CN.UTF-8";

    BROWSER = "firefox-beta";
    MAMBA_ROOT_PREFIX = c + "/micromamba";
    TERMINAL = "alacritty";
    WINEPREFIX = d + "/wine";
  };
}
