_: _: prev: {
  catppuccin-gtk = prev.catppuccin-gtk.override { accents = [ "sky" ]; };
  fcitx5-configtool = prev.fcitx5-configtool.override { kcmSupport = false; };
  # Fix yazi build
  _7zz = prev._7zz.overrideAttrs (old: {
    makeFlags = (old.makeFlags or [ ]) ++ [ "USE_ASM=" ];
  });
  # Fix sddm->weston->neatvnc build
  weston = prev.weston.override {
    vncSupport = false;
  };
}
