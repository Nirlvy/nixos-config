{ lib, ... }:
_: prev:
let
  withCommandLineArgs =
    { app }:
    prev.${app}.override {
      commandLineArgs = ''
        --enable-features=UseOzonePlatform \
        --ozone-platform=wayland \
        --enable-webrtc-pipewire-capturer \
        --enable-wayland-ime \
      '';
    };

  wrap =
    { app }:
    prev.${app}.overrideAttrs (o: {
      postInstall = lib.strings.concatStrings [
        "wrapProgram $out/bin/"
        (if (o.meta ? mainProgram) then o.meta.mainProgram else app)
        " --add-flags \"--enable-features=UseOzonePlatform\""
        " --add-flags \"--ozone-platform=wayland\""
        " --add-flags \"--enable-webrtc-pipewire-capturer\""
        " --add-flags \"--enable-wayland-ime\""
      ];
    });
in
{
  # obsidian = withCommandLineArgs { app = "obsidian"; };
  # vscode = withCommandLineArgs { app = "vscode"; };

  # obsidian = wrap { app = "obsidian"; };
  # vscode = wrap { app = "vscode"; };
}
