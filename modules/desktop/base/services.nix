{
  services = {
    # gnome-firmware
    fwupd.enable = false;

    zram-generator = {
      enable = true;
      settings.zram0 = {
        compression-algorithm = "zstd";
        zram-size = "ram";
      };
    };
  };
}
