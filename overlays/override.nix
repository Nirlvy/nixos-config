_: _: prev: {
  catppuccin-gtk = prev.catppuccin-gtk.override {
    accents = [ "sky" ];
    size = "compact";
    tweaks = [ "rimless" ];
  };

  mpv = prev.mpv.override { youtubeSupport = false; };

  qt6Packages = prev.qt6Packages // {
    fcitx5-with-addons = prev.qt6Packages.fcitx5-with-addons.override {
      fcitx5-configtool = prev.qt6Packages.fcitx5-configtool.override { kcmSupport = false; };
    };
  };

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

  wpsoffice = prev.wpsoffice.overrideAttrs (o: {
    nativeBuildInputs = o.nativeBuildInputs or [ ] ++ [ prev.zstd ];
    postInstall = ''
      mkdir -p $out/opt/kingsoft/wps-office/office6/mui/zh_CN
      tar -I zstd -xf ${../pkgs/resources/wps-office-mui-zh-cn.tar.zst} -C $out/opt/kingsoft/wps-office/office6/mui/zh_CN
    '';
  });
}
