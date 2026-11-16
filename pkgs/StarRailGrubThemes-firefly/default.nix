{ stdenvNoCC, fetchFromGitHub, ... }:
stdenvNoCC.mkDerivation {
  name = "StarRailGrubThemes";

  src = fetchFromGitHub {
    owner = "voidlhf";
    repo = "StarRailGrubThemes";
    rev = "e0dd4a0cd341349bf677d833e6a2140c871e3c40";
    hash = "sha256-LoMS7b8FDmZQJVOVOjmNj0JzSn5PHPzTyfwAU/FXdvk=";
  };

  installPhase = ''
    cp -r ./assets/themes/Firefly $out
  '';
}
