_: _: prev: {
  catppuccin-gtk = prev.catppuccin-gtk.override {
    accents = [ "sky" ];
    size = "compact";
    tweaks = [ "rimless" ];
  };
  fcitx5-configtool = prev.fcitx5-configtool.override { kcmSupport = false; };
}
