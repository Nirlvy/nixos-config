{ stdenvNoCC, fetchFromGitHub, ... }:
stdenvNoCC.mkDerivation {
  name = "StarRailGrubThemes";

  src = fetchFromGitHub {
    owner = "voidlhf";
    repo = "StarRailGrubThemes";
    rev = "97c14478b801d8fb2c19ffb2bba53894b0e4d3cd";
    hash = "sha256-5xPl5pbq0SRKXn2Fanvr7/Vi4SkURX0YUYQczhkm5aI=";
  };

  installPhase = ''
    cp -r ./assets/themes/Firefly $out
  '';
}
