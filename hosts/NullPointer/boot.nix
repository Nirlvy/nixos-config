{
  inputs,
  pkgs,
  self,
  ...
}:
{
  boot = {
    loader = {
      grub = rec {
        enable = true;
        device = "nodev";
        theme = pkgs.callPackage "${self}/pkgs/StarRailGrubThemes-firefly.nix" { };
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

    kernelPackages = pkgs.linuxPackages_xanmod_latest;

    plymouth = {
      enable = true;
      themePackages = [ inputs.nur-nirlvy.packages.${pkgs.system}.aris-plymouth ];
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
