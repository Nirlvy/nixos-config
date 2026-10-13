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

  fileSystems."/mnt/win-system" = {
    device = "/dev/disk/by-uuid/BF3AF1A1586BA781";
    fsType = "ntfs3";
    options = [
      "ro"
      "uid=1000"
      "gid=100"
      "umask=0022"
      "nofail"
      "noatime"
    ];
  };

  fileSystems."/mnt/win-others" = {
    device = "/dev/disk/by-uuid/406947A399BE3E24";
    fsType = "ntfs3";
    options = [
      "rw"
      "uid=1000"
      "gid=100"
      "umask=0022"
      "nofail"
      "noatime"
    ];
  };

  swapDevices = [ ];

  networking.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
