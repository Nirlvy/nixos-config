{ lib, ... }:
_: prev:
let
  x11Wrap =
    {
      app,
      bin ? null,
    }:
    prev.${app}.overrideAttrs {
      postInstall = lib.strings.concatStrings [
        "wrapProgram $out/bin/"
        (if bin != null then bin else app)
        " --set DISPLAY \":0\""
      ];
    };
in
{
  flatpak = x11Wrap { app = "flatpak"; };
  obsidian = x11Wrap { app = "obsidian"; };
  qq = x11Wrap { app = "qq"; };
  # steam
  vscode = x11Wrap {
    app = "vscode";
    bin = "code";
  };
}
