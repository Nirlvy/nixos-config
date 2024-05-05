(final: prev: {
  vscode =
    prev.vscode.override
    {
      commandLineArgs = ''
        -enable-features=UseOzonePlatform
        --ozone-platform=wayland
        --enable-wayland-ime
      '';
    };

  catppuccin-gtk = prev.catppuccin-gtk.override {
    accents = ["sky"];
  };
})
