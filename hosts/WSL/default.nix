{ inputs, lib, ... }:
{
  imports = [ inputs.nixos-wsl.nixosModules.default ];

  wsl = {
    enable = true;
    defaultUser = "nirlvy";
    useWindowsDrive = true;
  };
  programs.nix-ld.enable = lib.mkForce true;
  networking.hostName = "WSL";

  system.stateVersion = "25.05";
}
