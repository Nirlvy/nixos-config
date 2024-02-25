{ pkgs, ... }:

{
  imports =
    [ 
		../../modules/base
      ../../modules/desktop/hyprland.nix
    
      ./hardware-configuration.nix
    ];

  boot = {
  	loader = {
			grub = { 
				enable = true;
				device = "nodev";
				theme = pkgs.nixos-grub2-theme;
				efiSupport = true;
				useOSProber = true;
			};
			efi.canTouchEfiVariables = true;
			efi.efiSysMountPoint = "/boot";
		};
		supportedFilesystems = [ "bcachefs" "btrfs" "ntfs" ];
		kernelPackages = pkgs.linuxPackages_latest;
	};

  networking = {
  	hostName = "NullPointerException";
		networkmanager.enable = true;
	};

  system.stateVersion = "23.11"; 

}

