{ config, ... }:
let
  d = config.xdg.dataHome;
  cfg = config.xdg.configHome;
  ca = config.xdg.cacheHome;
  # s = config.xdg.stateHome;
in
{
  home.sessionVariables = {
    ANDROID_HOME = "${d}/android";
    CARGO_HOME = "${ca}/cargo";
    CONDARC = "${cfg}/condarc";
    CUDA_CACHE_PATH = "$XDG_CACHE_HOME/nv";
    DOTNET_CLI_HOME = "${d}/dotnet";
    GRADLE_USER_HOME = "${d}/gradle";
    GUNPG_HOME = "${cfg}/gnupg";
    HISTFILE = "${cfg}/bash_history";
    MAVEN_OPTS = "-Dmaven.repo.local=${d}/maven";
    NPM_CONFIG_USERCONFIG = "${cfg}/npmrc";
    NPM_CONFIG_CACHE = "${ca}/npm";
    NUGET_PACKAGES = "${d}/NuGetPackages";
    RUSTUP_HOME = "${d}/rustup";
  };
}
