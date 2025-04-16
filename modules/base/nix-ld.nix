{ config, pkgs, ... }:
{
  # by Mic92 dotfiles
  services.envfs.enable = false;
  programs.nix-ld = {
    enable = true;
    libraries =
      with pkgs;
      [
        acl
        dbus
        expat
        fontconfig
        freetype
        fuse3
        icu
        libnotify
        libunwind
        libusb1
        libuuid
        nspr
        nss
      ]
      ++ lib.optionals (config.hardware.graphics.enable) [
        pipewire
        cups
        libxkbcommon
        pango
        mesa
        libdrm
        libglvnd
        libpulseaudio
        atk
        cairo
        alsa-lib
        at-spi2-atk
        at-spi2-core
        gdk-pixbuf
        glib.out
        glibc
        gtk3
        libGL
        libappindicator-gtk3
        vulkan-loader
        xorg.libX11
        xorg.libXScrnSaver
        xorg.libXcomposite
        xorg.libXcursor
        xorg.libXdamage
        xorg.libXext
        xorg.libXfixes
        xorg.libXi
        xorg.libXrandr
        xorg.libXrender
        xorg.libXtst
        xorg.libxcb
        xorg.libxkbfile
        xorg.libxshmfence
      ];
  };
}
