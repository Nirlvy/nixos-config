{
  self,
  inputs,
  system,
  ...
}: let
  nixosSystem = inputs.nixpkgs.lib.nixosSystem;
  mod = "${self}/modules";
  specialArgs = {inherit self inputs system;};

  sharedModules = with inputs;[
    home-manager.nixosModules.home-manager
    {
      home-manager.useGlobalPkgs = true;
      home-manager.useUserPackages = false;

      home-manager.extraSpecialArgs = inputs;
      home-manager.users.nirlvy = import ../home;
    }
  ];
in {
  NullPointer = nixosSystem {
    inherit specialArgs;
    modules =
      [
        ./NullPointer

        "${mod}/base/base.nix"
        "${mod}/base/i18n.nix"
        "${mod}/base/misc.nix"
        "${mod}/base/network.nix"

        "${mod}/desktop/hyprland.nix"
      ]
      ++ sharedModules;
  };
}
