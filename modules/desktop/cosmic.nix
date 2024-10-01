{ inputs, self, ... }:
{
  imports = [
    inputs.nixos-cosmic.nixosModules.default

    ./base
    ./programs
    (import "${self}/modules/desktop/default.nix").de
  ];

  services = {
    displayManager.cosmic-greeter.enable = false;
    desktopManager.cosmic.enable = true;
  };
}
