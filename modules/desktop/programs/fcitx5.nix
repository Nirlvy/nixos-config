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
        fcitx5-gtk
        fcitx5-nord
        fcitx5-pinyin-moegirl
        fcitx5-pinyin-zhwiki
        libsForQt5.fcitx5-qt
      ];
    };
  };

  environment.variables =
    lib.mkIf (!config.i18n.inputMethod.fcitx5.waylandFrontend) {
      INPUT_METHOD = "fcitx";
      SDL_IM_MODULE = "fcitx";
      GLFW_IM_MODULE = "ibus";
    }
    // lib.mkIf (config.i18n.inputMethod.fcitx5.waylandFrontend) {
      # only kwin support text-input-v2
      QT_IM_MODULE = "fcitx";
      QT_IM_MODULES = "wayland;fcitx;ibus";
    };
}
