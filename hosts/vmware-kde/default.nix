{
  imports =
    [
      ../../modules/base
      ../../modules/desktop/kde.nix

      ./hardware-configuration.nix
    ];

  boot.loader.grub = {
    enable = true;
    device = "/dev/sda";
  };


  networking = {
    hostName = "vmware-kde";
    networkmanager.enable = true;
  };

  virtualisation.vmware.guest.enable = true;

  system.stateVersion = "23.11";

}

