{
  services = {
    flatpak.enable = true;

    v2raya.enable = true;
    resolved.enable = false;

    # For thunar
    gvfs.enable = true; # Mount, trash, and other functionalities
    tumbler.enable = true; # Thumbnail support for images
  };
}
