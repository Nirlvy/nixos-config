{ lib, pkgs, ... }:
{
  imports = [
    ./dae.nix
    ./hardware.nix
    ./ssh.nix
    # ./tailscale.nix
  ];

  environment.systemPackages = with pkgs; [
    wget
    curl
    aria2
  ];

  networking.firewall.enable = lib.mkDefault false;
}
