_: _: prev: {
  catppuccin-gtk = prev.catppuccin-gtk.override {
    accents = [ "sky" ];
    size = "compact";
    tweaks = [ "rimless" ];
  };

  mpv = prev.mpv.override { youtubeSupport = false; };

  obs-studio = prev.obs-studio.override { browserSupport = false; };

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
    nativeBuildInputs = o.nativeBuildInputs or [ ] ++ [
      prev.zstd
      prev.makeWrapper
    ];
    # if want to include system fonts, add this line
    # <dir>/run/current-system/sw/share/X11/fonts</dir>
    postInstall = ''
      mkdir -p $out/opt/kingsoft/wps-office/office6/mui/zh_CN
      tar -I zstd -xf ${../pkgs/resources/wps-office-mui-zh-cn.tar.zst} -C $out/opt/kingsoft/wps-office/office6/mui/zh_CN
      fontConfig="$out/share/wps-fontconfig.conf"
      cat > "$fontConfig" <<EOF
      <?xml version="1.0"?>
      <!DOCTYPE fontconfig SYSTEM "fonts.dtd">
      <fontconfig>
      <dir>${prev.corefonts}/share/fonts</dir>
      <dir>${prev.vistafonts}/share/fonts</dir>
      <dir>${prev.vistafonts-chs}/share/fonts</dir>
      <cachedir>$out/share/wps-fontconfig-cache</cachedir>
      </fontconfig>
      EOF
      for prog in $out/bin/*; do
        if [ -x "$prog" ]; then
          wrapProgram "$prog" \
            --set FONTCONFIG_FILE "$fontConfig" \
            --set FONTCONFIG_PATH "$out/share/wps-fontconfig-cache"
        fi
      done
    '';
  });
}
