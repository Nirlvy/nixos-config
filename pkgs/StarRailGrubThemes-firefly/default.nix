{ stdenvNoCC, fetchFromGitHub, ... }:
stdenvNoCC.mkDerivation {
  name = "StarRailGrubThemes";

  src = fetchFromGitHub {
    owner = "voidlhf";
    repo = "StarRailGrubThemes";
    rev = "6e7e87f48c3fe083739794aea0075d89ff3194aa";
    hash = "sha256-TUZAidwLXCQBeOiizK+KlYWRRkIwXzMzUtCVrmHVJwI=";
  };

  installPhase = ''
    cp -r ./assets/themes/Firefly $out
  '';
}
