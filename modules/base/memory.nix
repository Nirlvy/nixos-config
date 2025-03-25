{
  services.earlyoom.enable = true;
  systemd.oomd.enable = false;

  swapDevices = [
    {
      device = "/var/lib/swapfile";
      size = 16 * 1024;
    }
  ];
  zramSwap = {
    enable = true;
    memoryPercent = 100;
  };
}
