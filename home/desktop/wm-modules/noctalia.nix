{
  config,
  pkgs,
  inputs,
  ...
}:
{
  imports = [
    inputs.noctalia.homeModules.default
  ];

  programs.noctalia = {
    enable = true;
    package = inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default;
  };

  xdg.configFile."noctalia/config.toml".source =
    config.lib.file.mkOutOfStoreSymlink /etc/nixos/home/desktop/wm-modules/noctalia/config.toml;
  home.file."${config.xdg.stateHome}/noctalia/settings.toml".source =
    config.lib.file.mkOutOfStoreSymlink /etc/nixos/home/desktop/wm-modules/noctalia/settings.toml;
}
