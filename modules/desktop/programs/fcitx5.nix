{
  pkgs,
  lib,
  config,
  ...
}:
{
  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";
    fcitx5 = {
      waylandFrontend = true;
      addons = with pkgs; [
        fcitx5-configtool
        fcitx5-chinese-addons
        fcitx5-nord
        fcitx5-pinyin-moegirl
        fcitx5-pinyin-zhwiki
        fcitx5-gtk
        libsForQt5.fcitx5-qt
        kdePackages.fcitx5-qt
      ];
    };
  };

  environment.variables = {
    INPUT_METHOD = "fcitx";
    SDL_IM_MODULE = "fcitx";
    GLFW_IM_MODULE = "ibus";
  } // lib.mkIf (config.i18n.inputMethod.fcitx5.waylandFrontend) { QT_IM_MODULE = "fcitx"; };
}
