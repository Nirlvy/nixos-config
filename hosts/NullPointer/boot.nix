{ pkgs, ... }:
{
  boot = {
    loader = {
      grub = rec {
        enable = false;
        device = "nodev";
        theme = pkgs.StarRailGrubThemes-firefly;
        splashImage = "${theme}/background.png";
        efiSupport = true;
        useOSProber = true;
        configurationLimit = 10;
      };
      systemd-boot = {
        enable = true;
        configurationLimit = 5;
      };
      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot/efi";
      };
      timeout = 2;
    };

    tmp.useTmpfs = true;

    supportedFilesystems = [
      "btrfs"
      "exfat"
      "ext4"
      "fat32"
      "ntfs"
      "vfat"
    ];

    kernelPackages = pkgs.linuxPackages_latest;

    plymouth = {
      enable = true;
      themePackages = [ pkgs.aris-plymouth ];
      theme = "aris";
    };

    consoleLogLevel = 3;
    initrd.verbose = false;
    kernelParams = [
      "quiet"
      "systemd.show_status=auto"
      "rd.udev.log_level=3"
    ];
    kernel.sysctl."kernel.sysrq" = 1;
  };
}
