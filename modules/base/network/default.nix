{ lib, pkgs, ... }:
{
  imports = [
    ./proxy/dae

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
