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
  users.allowNoPasswordLogin = true;
  system.stateVersion = "25.05";
}
