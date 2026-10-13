{ lib, pkgs, ... }:
{
  imports = [
    ./proxy/clash-verge-rev.nix
    # ./proxy/mihomo

    ./hardware.nix
    ./ssh.nix
    ./easytier.nix
    # ./tailscale.nix
  ];

  environment.systemPackages = with pkgs; [
    wget
    curl
    aria2
  ];

  networking.firewall.enable = lib.mkDefault false;
}
