{
  writeShellScriptBin,
  lib,
  grim,
  slurp,
  swappy,
  wl-clipboard,
}:
let
  _ = lib.getExe;
in
writeShellScriptBin "wl-shot-edit" ''
  ${_ grim} -g "$(${_ slurp} -d)" - | ${_ swappy} -f - -o - | ${wl-clipboard}/bin/wl-copy
''
