{
  services = {
    flatpak.enable = true;

    # thunar
    gvfs.enable = true; # Mount, trash, and other functionalities
    tumbler.enable = true; # Thumbnail support for images

    # gnome-firmware
    fwupd.enable = false;
  };
}
