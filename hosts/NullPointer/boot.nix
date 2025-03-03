{ pkgs, ... }:
{
  boot = {
    loader = {
      grub = rec {
        enable = true;
        device = "nodev";
        theme = pkgs.StarRailGrubThemes-firefly;
        splashImage = "${theme}/background.png";
        efiSupport = true;
        useOSProber = true;
        configurationLimit = 10;
      };
      efi.canTouchEfiVariables = true;
      efi.efiSysMountPoint = "/boot/efi";
    };

    supportedFilesystems = [
      "btrfs"
      "exfat"
      "ext4"
      "fat32"
      "ntfs"
      "vfat"
    ];

    kernelPackages = pkgs.linuxPackages;

    plymouth = {
      enable = true;
      themePackages = [ pkgs.aris-plymouth ];
      theme = "aris";
    };

    consoleLogLevel = 3;
    initrd.verbose = false;
    kernelParams = [
      "quiet"
      "splash"
      "systemd.show_status=auto"
      "rd.udev.log_level=3"
    ];
    loader.timeout = 1;
  };
}
