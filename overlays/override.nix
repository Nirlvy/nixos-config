_: final: prev: {
  catppuccin-gtk = prev.catppuccin-gtk.override {
    accents = [ "sky" ];
    size = "compact";
    tweaks = [ "rimless" ];
  };

  jetbrains =
    let
      jetbra = prev.fetchFromGitHub {
        owner = "WhyFeelSad";
        repo = "jetbra";
        rev = "631a187dfe45652f23a0d0b0a030abccc6c648f9";
        sha256 = "sha256-FvjwrmRE9xXkDIIkOyxVEFdycYa/t2Z0EgBueV+26BQ=";
      };
      # https://jetbra.in/5d84466e31722979266057664941a71893322460
      vmoptions = ''
        --add-opens=java.base/jdk.internal.org.objectweb.asm=ALL-UNNAMED
        --add-opens=java.base/jdk.internal.org.objectweb.asm.tree=ALL-UNNAMED
        -javaagent:${jetbra}/ja-netfilter.jar=jetbrains
      '';
    in
    prev.jetbrains
    // prev.lib.genAttrs [ "clion" "idea-ultimate" "rust-rover" "pycharm-professional" ] (
      name:
      (prev.jetbrains.${name}.override {
        forceWayland = true;
        vmopts = vmoptions;
      })
    );

  mpv = prev.mpv-unwrapped.wrapper {
    mpv = prev.mpv-unwrapped.override { vapoursynthSupport = true; };
    extraMakeWrapperArgs = [
      "--prefix"
      "LD_LIBRARY_PATH"
      ":"
      "/run/opengl-driver/lib:${prev.lib.makeLibraryPath [ prev.ocl-icd ]}"
    ];
  };

  # obs-studio = prev.obs-studio.override { browserSupport = false; };

  qt6Packages = prev.qt6Packages // {
    fcitx5-with-addons = prev.qt6Packages.fcitx5-with-addons.override {
      fcitx5-configtool = prev.qt6Packages.fcitx5-configtool.override { kcmSupport = false; };
    };
  };

  svp = prev.svp.overrideAttrs { mpvForSVP = final.mpv; };

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
      <dir>${prev.vista-fonts-chs}/share/fonts</dir>
      <dir>${prev.callPackage ../pkgs/ttf-wps-fonts { }}/share/fonts</dir>
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
