{ stdenvNoCC, fetchFromGitHub, ... }:
stdenvNoCC.mkDerivation {
  name = "StarRailGrubThemes";

  src = fetchFromGitHub {
    owner = "voidlhf";
    repo = "StarRailGrubThemes";
    rev = "9ff3e3e42232ec1d0c6c6ca23e4db41f44defd89";
    hash = "sha256-uqTs0AfYv5a0qqMl5HubIQT0A/TgiYcnc9Ue0/dVm5Q=";
  };

  installPhase = ''
    cp -r ./assets/themes/Firefly $out
  '';
}
