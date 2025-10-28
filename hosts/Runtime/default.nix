{
  imports = [
    ./boot.nix
    ./graphics.nix

    ./hardware-configuration.nix
  ];

  hardware.enableAllFirmware = true;

  networking = {
    hostName = "Runtime";
    networkmanager.enable = true;
  };

  services.btrfs.autoScrub = {
    enable = true;
    interval = "weekly";
    fileSystems = [ "/" ];
  };

  services.fstrim.enable = true;

  system.stateVersion = "25.05";
}
