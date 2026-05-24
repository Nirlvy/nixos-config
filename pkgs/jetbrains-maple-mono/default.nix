{
  stdenvNoCC,
  fetchzip,
  lib,
  variants ? "XX-XX-XX-XX",
}:
let
  pname = "jetbrains-maple-mono";
  owner = "SpaceTimee";
  version = "1.2304.79";

  # NF: Nerd Font
  # NR: CN Narrow
  # NL: No Ligatures
  # HT: Hinted (for low resolution displays)
  hashes = {
    NF-NR-NL-HT = "du5dc4DVDenW+g13ls5EZQ8RpKqY5RAwzDNpx9ZivBk=";
    NF-NR-NL-XX = "tANvI3mFt5LbXNFvlEr59cZOr8Rh7TyfHg0nT4mOe6M=";
    NF-NR-XX-HT = "x9caOc9abE+ChrnwCXg+pPnKktWvbino1me45l6l+Jo=";
    NF-NR-XX-XX = "tGPhMFdROMG0dwR76VQoJHPfaH6WhEsRcLy3PgAXy+c=";
    NF-XX-NL-HT = "FRApSzpO5r1oaAxpP7IPGXns5XsRsQYevbh8fMiIsag=";
    NF-XX-NL-XX = "VOZROLLJejVg2iXLXopiOhZnNc+xX8P4qTPZ7B+VKFM=";
    NF-XX-XX-HT = "kqF1zaT23HWtuDAI7gFJa9IeKgJgUnGdpWsf2XuoEVc=";
    NF-XX-XX-XX = "Pf/JAGurpwfKxhgmB1z6rJFjDAuSP5ZnRi1T1xfFtdM=";
    XX-NR-NL-HT = "yemhxhJyMVrTLHJyeI1zazp6Evng3UGSmcbhsPsSoAs=";
    XX-NR-NL-XX = "pc4cYrIiuOQA7kwNjZXn6TP0UIgdDMo5+P6ZoId7+n4=";
    XX-NR-XX-HT = "P1omEeLdtqnYaHn6k5V1TeegHuGlCvxUCvYcrjnxnfA=";
    XX-NR-XX-XX = "kNJAavmwkLoh2V8fsCbAB37M7634R6N27gUeHL3kDNQ=";
    XX-XX-NL-HT = "DgDT7tzpwOeYpweJThudJaX5TfHGt+RjYS7Ca5tCKV4=";
    XX-XX-NL-XX = "OkPZir12moTOxvfLgncqCc+DdrJtjMQUI2vl9sS/tQM=";
    XX-XX-XX-HT = "YMEOptwFpUkVvAmy1lQ+vAKfSGEO/xbYD+keUEqCc3I=";
    XX-XX-XX-XX = "MMYuxb+bhpQb+hwiZHLIk8fEXTHcnqMHLMVbJ1nKcgY=";
  };
in
stdenvNoCC.mkDerivation {
  inherit pname version;

  src = fetchzip {
    url = "https://github.com/${owner}/Fusion-JetBrainsMapleMono/releases/download/${version}/JetBrainsMapleMono-${variants}.zip";
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
