{
  lib,
  buildNpmPackage,
  fetchgit,
  fetchurl,
}:
buildNpmPackage rec {
  pname = "delance-runtime";
  version = "2025.4.100";

  src = fetchgit {
    url = "https://git.sr.ht/~self/delance-runtime";
    rev = "v${version}";
    sha256 = "KWl38mhWfjBVhDgLq6/st7hWulqGhkAYkZs5wd0j1Io=";
  };

  vsixFile = fetchurl {
    url = "https://marketplace.visualstudio.com/_apis/public/gallery/publishers/ms-python/vsextensions/vscode-pylance/${version}/vspackage";
    sha256 = "y18isvEgKDJqVgDT2BCjkZUIHFbq2qKrtExs8i9DADs=";
  };

  postPatch = ''
    cp ${./package-lock.json} package-lock.json
    mkdir -p .cache
    cp ${vsixFile} .cache/delance-${version}.vsix
    substituteInPlace install.mjs \
      --replace-fail 'await getPkg()' 'await fs.readFile(".cache/delance-${version}.vsix")'
  '';

  preBuild = ''
    substituteInPlace install.mjs \
      --replace-fail 'await getPkg()' 'await fs.readFile(.cache/delance-${version}.vsix);'
  '';

  npmDepsHash = "sha256-l+2WfLyEAq+XDmIwStWEz9PJ0zTvi+lFN/VL88lScqg=";

  npmPackFlags = [ "--ignore-scripts" ];

  meta = {
    description = "The language server runtime of delance";
    license = lib.licenses.bsd0;
  };
}
