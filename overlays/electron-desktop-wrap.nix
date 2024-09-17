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

  x11Wrap =
    { app }:
    prev.symlinkJoin {
      name = app;
      paths = [ prev.${app} ];
      buildInputs = [ prev.makeWrapper ];
      postBuild = ''
        wrapProgram $out/bin/* --set DISPLAY :0
      '';
    };
in
{
  # obsidian = withCommandLineArgs { app = "obsidian"; };
  # vscode = withCommandLineArgs { app = "vscode"; };

  # obsidian = wrap { app = "obsidian"; };
  # vscode = wrap {
  #   app = "vscode";
  #   bin = "code";
  #   suffix = "%F";
  # };

  # obsidian = x11Wrap { app = "obsidian"; };
  # vscode = x11Wrap { app = "vscode"; };
  wechat-uos = x11Wrap { app = "wechat-uos"; };
}
