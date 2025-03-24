_: _: prev: {
  catppuccin-gtk = prev.catppuccin-gtk.override {
    accents = [ "sky" ];
    size = "compact";
    tweaks = [ "rimless" ];
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
  # https://github.com/NixOS/nixpkgs/pull/392319
  zed-editor = prev.zed-editor.overrideAttrs (o: {
    postPatch =
      o.postPatch or ''''
      +
        # nixpkgs ships cargo-about 0.7, which is a seamless upgrade from 0.6
        ''
          substituteInPlace script/generate-licenses \
            --replace-fail 'CARGO_ABOUT_VERSION="0.6"' 'CARGO_ABOUT_VERSION="0.7"'
        '';
  });
}
