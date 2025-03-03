{ stdenvNoCC, fetchFromGitHub, ... }:
stdenvNoCC.mkDerivation {
  name = "StarRailGrubThemes";

  src = fetchFromGitHub {
    owner = "voidlhf";
    repo = "StarRailGrubThemes";
    rev = "0f208452b2722349108799a60615ab8e63163c77";
    hash = "sha256-uqTs0AfYv5a0qqMl5HubIQT0A/TgiYcnc9Ue0/dVm5Q=";
  };

  installPhase = ''
    cp -r ./assets/themes/Firefly $out
  '';
}
