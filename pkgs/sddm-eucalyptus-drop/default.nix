{
  stdenvNoCC,
  fetchFromGitLab,
  lib,
  background ? null,
  ScreenWidth ? "1920",
  ScreenHeight ? "1080",
  FormPosition ? "left",
  InterfaceShadowOpacity ? "0.6",
  Font ? "Noto Sans",
  FontSize ? "",
  Locale ? "en_US.UTF-8",
  HeaderText ? "Welcome!",
}:
let
  pname = "sddm-eucalyptus-drop";
  owner = "Matt.Jolly";
in
stdenvNoCC.mkDerivation {
  pname = pname;
  version = "2024-10-3";

  src = fetchFromGitLab {
    owner = owner;
    repo = pname;
    rev = "0b82ca465b7dac6d7ff15ebaf1b2f26daba5d126";
    sha256 = "SUOqcK7fGb5OnWmB4Wenqr9PPiagYUoEHjLd5CM6fyk=";
  };

  dontWrapQtApps = true;

  installPhase = ''
    runHook preInstall

    mkdir -p $out/share/sddm/themes
    cp -r $src $out/share/sddm/themes/eucalyptus-drop

    configFile=$out/share/sddm/themes/eucalyptus-drop/theme.conf

    ${lib.optionalString (background != null) ''
      substituteInPlace $configFile \
        --replace-fail 'Background="Backgrounds/david-clode-seM6i8gJ7d0-unsplash.jpg"' 'Background="${background}"'
    ''}

    substituteInPlace $configFile \
      --replace-fail 'ScreenWidth="2560"' 'ScreenWidth="${ScreenWidth}"' \
      --replace-fail 'ScreenHeight="1440"' 'ScreenHeight="${ScreenHeight}"' \
      --replace-fail 'FormPosition="left"' 'FormPosition="${FormPosition}"' \
      --replace-fail 'InterfaceShadowOpacity="0.6"' 'InterfaceShadowOpacity="${InterfaceShadowOpacity}"' \
      --replace-fail 'Font="Noto Sans"' 'Font="${Font}"' \
      --replace-fail 'FontSize=""' 'FontSize=${FontSize}' \
      --replace-fail 'Locale=""' 'Locale="${Locale}"' \
      --replace-fail 'HeaderText="Welcome!"' 'HeaderText="${HeaderText}"'

    runHook postInstall
  '';

  meta = {
    description = "An enhanced fork of SDDM Sugar Candy by Marian Arlt";
    homepage = "https://gitlab.com/${owner}/${pname}";
    license = lib.licenses.gpl3;
    platforms = lib.platforms.linux;
  };
}
