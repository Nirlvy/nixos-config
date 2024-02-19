{ config, pkgs, ... }:

{
  imports =
    [
      ../../modules/base
      ../../modules/desktop

      ./hardware-configuration.nix
    ];

  boot.loader.grub = {
    enable = true;
    device = "/dev/sda";
    useOSProber = true;
  };


  networking = {
    hostName = "vmware-hyprland";

    networkmanager.enable = true;
    # networking.wireless.enable = true;
  };

  virtualisation.vmware.guest.enable = true;

  # environment.systemPackages = with pkgs; [
  #   open-vm-tools
  # ];

  # for Nvidia GPU
  # services.xserver.videoDrivers = ["nvidia"];
  # hardware.opengl.enable = true;
  # hardware.nvidia = {
  #   package = config.boot.kernelPackages.nvidiaPackages.stable;
  #   modesetting.enable = true;
  # };

  system.stateVersion = "23.11";

}

