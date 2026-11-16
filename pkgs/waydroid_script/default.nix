{
  stdenv,
  fetchFromGitHub,
  python3,
  ...
}:
stdenv.mkDerivation {
  name = "waydroid_script";
  version = "2024-01-20";

  src = fetchFromGitHub {
    owner = "casualsnek";
    repo = "waydroid_script";
    rev = "4a50dabd97fcb632a608b1421105258862a5b994";
    hash = "sha256-J6IMebq5WLRXHi9zV7wWX91JQkVVKevE1NfRm84Iids=";
  };

  buildInputs = [
    (python3.withPackages (
      ps: with ps; [
        tqdm
        requests
        inquirerpy
      ]
    ))
  ];

  postPatch = ''
    patchShebangs main.py
  '';

  installPhase = ''
    mkdir -p $out/libexec
    cp -r . $out/libexec/waydroid_script
    mkdir -p $out/bin
    ln -s $out/libexec/waydroid_script/main.py $out/bin/waydroid_script
  '';
}
