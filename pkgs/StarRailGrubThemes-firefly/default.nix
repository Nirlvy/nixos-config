{ stdenvNoCC, fetchFromGitHub, ... }:
stdenvNoCC.mkDerivation {
  name = "StarRailGrubThemes";

  src = fetchFromGitHub {
    owner = "voidlhf";
    repo = "StarRailGrubThemes";
    rev = "815938cd3d6dfa53918217c31a2175c1aaad3469";
    hash = "sha256-sluhUccj+1qrX7nbGlv4O9mEM89HWv48w4Jb1iN3CXk=";
  };

  installPhase = ''
    cp -r ./assets/themes/Firefly $out
  '';
}
