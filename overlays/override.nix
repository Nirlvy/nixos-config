_: _: prev: {
  catppuccin-gtk = prev.catppuccin-gtk.override {
    accents = [ "sky" ];
    size = "compact";
    tweaks = [ "rimless" ];
  };
  fcitx5-configtool = prev.fcitx5-configtool.override { kcmSupport = false; };
  tela-icon-theme = prev.tela-icon-theme.overrideAttrs {
    dontCheckForBrokenSymlinks = true;
    installPhase = ''
      runHook preInstall

      patchShebangs install.sh
      mkdir -p $out/share/icons
      ./install.sh -d $out/share/icons
      jdupes -l -r $out/share/icons

      runHook postInstall
    '';
  };
}
