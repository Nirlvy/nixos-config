{ config, ... }:
let
  d = config.xdg.dataHome;
  cfg = config.xdg.configHome;
  ca = config.xdg.cacheHome;
  # s = config.xdg.stateHome;
in
{
  home.sessionVariables = {
    # LANG = "zh_CN.UTF-8";

    # _JAVA_OPTIONS = "-Dawt.useSystemAAFontSettings=lcd";
    ANDROID_HOME = "${d}/android";
    CARGO_HOME = "${ca}/cargo";
    CONDARC = "${cfg}/condarc";
    GUNPG_HOME = "${cfg}/gnupg";
    HISTFILE = "${cfg}/bash_history";
    NPM_CONFIG_USERCONFIG = "${cfg}/npmrc";
    RUSTUP_HOME = "${d}/rustup";
  };
}
