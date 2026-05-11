{
  services.earlyoom.enable = true;
  systemd.oomd.enable = false;
  # swapDevices = [
  #   {
  #     device = "/var/lib/swapfile";
  #     size = 16 * 1024;
  #   }
  # ];
  # zramSwap = {
  #   enable = true;
  #   memoryPercent = 100;
  # };
  boot.kernelParams = [
    "zswap.enabled=1" # enables zswap
    "zswap.compressor=lz4" # compression algorithm
    "zswap.max_pool_percent=20" # maximum percentage of RAM that zswap is allowed to use
    "zswap.shrinker_enabled=1" # whether to shrink the pool proactively on high memory pressure
  ];
}
