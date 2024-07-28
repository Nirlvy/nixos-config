{
  imports = [
    ./boot.nix
    # ./nvidia.nix

    ./hardware-configuration.nix
  ];

  networking = {
    hostName = "NullPointer";
    networkmanager.enable = true;
  };

  services.btrfs.autoScrub = {
    enable = true;
    interval = "weekly";
    fileSystems = [ "/" ];
  };

  services.fstrim.enable = true;

  system.stateVersion = "23.11";
}
