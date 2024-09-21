_: _: prev:
let
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
  wechat-uos = x11Wrap { app = "wechat-uos"; };
}
