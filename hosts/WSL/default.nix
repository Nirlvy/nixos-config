{ inputs, lib, ... }:
{
  imports = [ inputs.nixos-wsl.nixosModules.default ];

  wsl = {
    enable = true;
    defaultUser = "nirlvy";
    useWindowsDriver = true;
  };
  programs.nix-ld.enable = lib.mkForce true;
  networking.hostName = "WSL";
  users = {
    allowNoPasswordLogin = true;
    users.nirlvy.hashedPasswordFile = lib.mkForce null;
  };
  system.stateVersion = "25.05";
}
