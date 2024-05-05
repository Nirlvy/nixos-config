{
  inputs,
  pkgs,
  ...
}: {
  boot = {
    loader = {
      grub = rec {
        enable = true;
        device = "nodev";
        theme = inputs.honkai-railway-grub-theme.packages.${pkgs.system}.acheron-grub-theme;
        splashImage = "${theme}/background.png";
        efiSupport = true;
        useOSProber = true;
        configurationLimit = 10;
      };
      efi.canTouchEfiVariables = true;
      efi.efiSysMountPoint = "/boot/efi";
    };
    supportedFilesystems = ["btrfs" "ntfs"];
    kernelPackages = pkgs.linuxPackages_xanmod_latest;
  };
}
