{
  config,
  lib,
  modulesPath,
  ...
}:
{
  imports = [ (modulesPath + "/installer/scan/not-detected.nix") ];

  boot.initrd.availableKernelModules = [
    "xhci_pci"
    "ahci"
    "nvme"
    "usb_storage"
    "usbhid"
    "sd_mod"
  ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-amd" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/bcae321d-0133-458f-90f7-cdf1a47042c7";
    fsType = "btrfs";
    options = [
      "compress=zstd"
      "subvol=root"
    ];
  };

  fileSystems."/home" = {
    device = "/dev/disk/by-uuid/bcae321d-0133-458f-90f7-cdf1a47042c7";
    fsType = "btrfs";
    options = [
      "compress=zstd"
      "subvol=home"
    ];
  };

  fileSystems."/nix" = {
    device = "/dev/disk/by-uuid/bcae321d-0133-458f-90f7-cdf1a47042c7";
    fsType = "btrfs";
    options = [
      "compress=zstd"
      "subvol=nix"
      "noatime"
    ];
  };

  fileSystems."/boot/efi" = {
    device = "/dev/disk/by-uuid/38C9-815D";
    fsType = "vfat";
  };

  swapDevices = [ ];

  networking.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
