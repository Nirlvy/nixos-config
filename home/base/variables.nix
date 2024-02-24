{ config, ... }:

let
  d = config.xdg.dataHome;
  c = config.xdg.configHome;
  cache = config.xdg.cacheHome;
in

rec {

  home.sessionVariables = {

    WINEPREFIX = d + "/wine";
    BROWSER = "firefox";

  };
}
