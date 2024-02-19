{ lib, pkgs, ... }:

{

  environment.systemPackages = with pkgs; [
    wget
    curl
    aria2
  ];

  networking.firewall.enable = lib.mkDefault false;

}
