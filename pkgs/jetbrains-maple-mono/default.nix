{
  stdenvNoCC,
  fetchzip,
  lib,
  variants ? "XX-XX-XX",
}:
let
  pname = "jetbrains-maple-mono";
  owner = "SpaceTimee";
  version = "1.2304.70";

  # NF: Nerd Font
  # NR: CN Narrow
  # HT: Hinted (for low resolution displays)
  hashes = {
    NF-NR-HT = "nlloDeotF+6MSjRrxSFqap2p4XB/Zq5clWW/krzIzDI=";
    NF-NR-XX = "Eg5EYnT/dbDec+aHw7Bjldw3QDeaNOjg5f46BpfSA4Y=";
    NF-XX-HT = "pc/5BeJaac9gNTRAQSsLYhGN0M5/KGXv+WQkd03Y2rM=";
    NF-XX-XX = "ZyTW11BRaZ5v1fi/akMcGtYxhAkJHyqhWIKoVk+O5P0=";
    XX-NR-HT = "MHJUcFYcXpPGYylQ5waxCMCkZco5JfOfbkttOjHPpFk=";
    XX-NR-XX = "/O5dQol0/J2Wa0XLC1joCTvWQMXwIfz5VRzpJQf4i04=";
    XX-XX-HT = "BaIY7uM7f2vPzDquvt/gmkJrqIZXHSpnmulGpKqfJrg=";
    XX-XX-XX = "9IIXBrS4gJvBiDceoMtPS01DC5ZCXhfbj4Lv6bxBqx8=";
  };
in
stdenvNoCC.mkDerivation {
  inherit pname version;

  src = fetchzip {
    url = "https://github.com/SpaceTimee/Fusion-JetBrainsMapleMono/releases/download/${version}/JetBrainsMapleMono-${variants}.zip";
    sha256 = hashes.${variants};
    stripRoot = false;
  };

  installPhase = ''
    runHook preInstall

    mkdir -p $out/share/fonts/truetype
    install -Dm444 $src/*.ttf $out/share/fonts/truetype

    runHook postInstall
  '';

  meta = {
    description = "JetBrains Maple Mono: The free and open-source font fused with JetBrains Mono & Maple Mono";
    homepage = "https://github.com/${owner}/Fusion-JetBrainsMapleMono";
    license = lib.licenses.ofl;
    platforms = lib.platforms.linux;
  };
}
