{
  services = {
    flatpak.enable = true;

    v2raya.enable = true;
    resolved.enable = false;

    # thunar
    gvfs.enable = true; # Mount, trash, and other functionalities
    tumbler.enable = true; # Thumbnail support for images

    # gnome-firmware
    fwupd.enable = true;

    xserver.desktopManager.xterm.enable = false;
  };
}