_: _: prev:
let
  x11Wrap =
    { app }:
    prev.symlinkJoin {
      name = app;
      paths = [ prev.${app} ];
      buildInputs = [ prev.makeWrapper ];
      postBuild = ''
        wrapProgram $out/bin/* --set DISPLAY :0 --set GTK_IM_MODULE fcitx
      '';   
    };
in
{
  # FIXME: core dump
  # code = x11Wrap { app = "code"; };
  # TDOD: bin not in $out/bin
  # steam = x11Wrap { app = "steam"; };
  obsidian = x11Wrap { app = "obsidian"; };
  # FIXME: qq %U will be core dump
  qq = x11Wrap { app = "qq"; };
  wechat-uos = x11Wrap { app = "wechat-uos"; };
}
