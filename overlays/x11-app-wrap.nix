{ lib, ... }:
_: prev:
let
  x11Wrap =
    { app }:
    prev.${app}.overrideAttrs (o: {
      postInstall = lib.strings.concatStrings [
        "wrapProgram $out/bin/"
        (if (o.meta ? mainProgram) then o.meta.mainProgram else app)
        " --set DISPLAY \":0\""
      ];
    });
in
{
  # flatpak = x11Wrap { app = "flatpak"; };
  # obsidian = x11Wrap { app = "obsidian"; };
  # qq = x11Wrap { app = "qq"; };
  # # steam
  # vscode = x11Wrap { app = "vscode"; };
}
