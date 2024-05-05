{
  pkgs,
  lib,
  config,
  ...
}: {
  i18n.inputMethod = {
    enabled = "fcitx5";
    fcitx5 = {
      waylandFrontend = true;
      addons = with pkgs; [
        fcitx5-configtool
        fcitx5-chinese-addons
        fcitx5-gtk
        fcitx5-nord
        libsForQt5.fcitx5-qt
      ];
    };
  };

  environment.variables = lib.mkIf (!config.i18n.inputMethod.fcitx5.waylandFrontend) {
    INPUT_METHOD = "fcitx";
    SDL_IM_MODULE = "fcitx";
    GLFW_IM_MODULE = "ibus";
  };
}
