{
  stdenvNoCC,
  fetchFromGitHub,
  lib,
}:
let
  pname = "ttf-wps-fonts";
  owner = "ferion11";
in
stdenvNoCC.mkDerivation {
  pname = pname;
  version = "2024-1-10";

  src = fetchFromGitHub {
    owner = owner;
    repo = pname;
    rev = "f4131f029934a76ea90336c8ee4929c5c78588f4";
    sha256 = "LB7/VHTB3tPOqXoq0kaCw7VmaE4ZRSbwDvzhxPMsz+k=";
  };

  installPhase = ''
    runHook preInstall

    mkdir -p $out/share/fonts/truetype
    install -Dm444 $src/*.ttf $out/share/fonts/truetype

    runHook postInstall
  '';

  meta = {
    description = "Symbol fonts required by wps-office.";
    homepage = "https://github.com/${owner}/${pname}";
    platforms = lib.platforms.linux;
  };
}
