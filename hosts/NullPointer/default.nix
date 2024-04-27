{
  pkgs,
  inputs,
  config,
  lib,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
  ];

  boot = {
    loader = {
      grub = {
        enable = true;
        device = "nodev";
        theme = inputs.nur-nirlvy.packages.${pkgs.system}.Acheron_cn-grub-theme;
        efiSupport = true;
        useOSProber = true;
      };
      efi.canTouchEfiVariables = true;
      efi.efiSysMountPoint = "/boot/efi";
    };
    supportedFilesystems = ["btrfs" "ntfs"];
    kernelPackages = pkgs.linuxPackages_xanmod_latest;
  };

  networking = {
    hostName = "NullPointer";
    networkmanager.enable = true;
  };

  services.xserver.videoDrivers = ["nvidia"];

  hardware = {
    opengl = {
      enable = true;
      driSupport = true;
      driSupport32Bit = true;
    };

    nvidia = {
      modesetting.enable = true;

      powerManagement.enable = false;
      powerManagement.finegrained = false;

      open = false;

      nvidiaSettings = true;

      package = config.boot.kernelPackages.nvidiaPackages.stable;

      prime = {
        sync.enable = true;

        intelBusId = "PCI:0:2:0";
        nvidiaBusId = "PCI:1:0:0";
      };
    };
  };

  specialisation = {
    on-the-go.configuration = {
      system.nixos.tags = ["on-the-go"];
      hardware.nvidia = {
        prime.offload.enable = lib.mkForce true;
        prime.offload.enableOffloadCmd = lib.mkForce true;
        prime.sync.enable = lib.mkForce false;
        # Experimental
        powerManagement.enable = lib.mkForce true;
        powerManagement.finegrained = lib.mkForce true;
      };
    };
  };

  services.btrfs.autoScrub = {
    enable = true;
    interval = "weekly";
    fileSystems = ["/"];
  };

  system.stateVersion = "23.11";
}
