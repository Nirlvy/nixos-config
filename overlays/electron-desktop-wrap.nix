{ lib, ... }:
_final: prev:
let
  wrap =
    {
      app,
      bin ? null,
      suffix ? "",
    }:
    prev.symlinkJoin {
      name = app;
      paths = [ prev.${app} ];
      buildInputs = [ prev.makeWrapper ];
      postBuild = lib.strings.concatStrings [
        "wrapProgram $out/bin/"
        (if bin != null then bin else app)
        " --add-flags \"--enable-features=UseOzonePlatform\""
        " --add-flags \"--ozone-platform=wayland\""
        " --add-flags \"--enable-webrtc-pipewire-capturer\""
        " --add-flags \"--enable-wayland-ime\""
        " --add-flags ${suffix}"
      ];
    };
in
{
  qq = wrap { app = "qq"; };
  obsidian = wrap { app = "obsidian"; };
  vscode = wrap {
    app = "vscode";
    bin = "code";
    suffix = "%F";
  };
}
