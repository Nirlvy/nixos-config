_: _: prev: {
  catppuccin-gtk = prev.catppuccin-gtk.override {
    accents = [ "sky" ];
    size = "compact";
    tweaks = [ "rimless" ];
  };
  fcitx5-configtool = prev.fcitx5-configtool.override { kcmSupport = false; };
  # fix gcc14
  dmraid = prev.dmraid.overrideAttrs (o: {
    patches = o.patches ++ [
      (prev.fetchpatch2 {
        url = "https://raw.githubusercontent.com/NixOS/nixpkgs/f298cd74e67a841289fd0f10ef4ee85cfbbc4133/pkgs/os-specific/linux/dmraid/fix-dmevent_tool.patch";
        hash = "sha256-MmAzpdM3UNRdOk66CnBxVGgbJTzJK43E8EVBfuCFppc=";
      })
    ];
  });
}
