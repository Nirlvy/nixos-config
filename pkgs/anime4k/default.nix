{
  lib,
  stdenvNoCC,
  fetchzip,
}:
stdenvNoCC.mkDerivation (finalAttrs: {
  pname = "anime4k";
  version = "v4.0.1";

  src = fetchzip {
    url = "https://github.com/bloc97/Anime4K/releases/download/${finalAttrs.version}/Anime4K_v4.0.zip";
    sha256 = "9B6U+KEVlhUIIOrDauIN3aVUjZ/gQHjFArS4uf/BpaM=";
    stripRoot = false;
  };

  installPhase = ''
    runHook preInstall

    mkdir -p $out/
    cp -r $src/* $out/

    runHook postInstall
  '';

  meta = {
    description = "Anime4K is a set of open-source, high-quality real-time anime upscaling/denoising algorithms that can be implemented in any programming language.";
    homepage = "https://github.com/bloc97/Anime4K";
    license = lib.licenses.mit;
  };
})
