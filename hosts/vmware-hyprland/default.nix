{

  imports =
    [
      ../../modules/base
      ../../modules/desktop/hyprland.nix

      ./hardware-configuration.nix
    ];

  boot.loader.grub = {
    enable = true;
    device = "/dev/sda";
  };


  networking = {
    hostName = "vmware-hyprland";
    networkmanager.enable = true;
  };

  virtualisation.vmware.guest.enable = true;

  system.stateVersion = "23.11";

}

