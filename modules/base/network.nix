{ lib, pkgs, ... }:
{
  hardware = {
    bluetooth = {
      enable = true;
      powerOnBoot = true;
      settings.General.Experimental = true;
    };
  };

  services.blueman.enable = true;

  environment.systemPackages = with pkgs; [
    wget
    curl
    aria2
  ];

  networking.firewall.enable = lib.mkDefault false;
}
