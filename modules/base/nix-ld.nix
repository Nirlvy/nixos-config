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
        libX11
        libXScrnSaver
        libXcomposite
        libXcursor
        libXdamage
        libXext
        libXfixes
        libXi
        libXrandr
        libXrender
        libXtst
        libxcb
        libxkbfile
        libxshmfence
      ];
  };
}
