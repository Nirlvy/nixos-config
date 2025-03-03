args:
let
  loadOverlays = builtins.map (f: (import (./. + "/${f}") args)) (
    builtins.filter (f: f != "default.nix") (builtins.attrNames (builtins.readDir ./.))
  );
  pkgsOverlay =
    _: super:
    builtins.listToAttrs (
      map
        (dir: {
          name = dir;
          value = super.callPackage (../pkgs + "/${dir}") { };
        })
        (
          builtins.filter (dir: builtins.pathExists (../pkgs + "/${dir}/default.nix")) (
            builtins.attrNames (builtins.readDir ../pkgs)
          )
        )
    );
in
loadOverlays ++ [ pkgsOverlay ]
