{ config, ... }:
let
  d = config.xdg.dataHome;
  cfg = config.xdg.configHome;
  ca = config.xdg.cacheHome;
  # s = config.xdg.stateHome;
in
{
  home.sessionVariables = {
    LANG = "zh_CN.UTF-8";

    ANDROID_HOME = "${d}/android";
    CARGO_HOME = "${ca}/cargo";
    HISTFILE = "${cfg}/bash_history";
    RUSTUP_HOME = "${d}/rustup";
  };
}
