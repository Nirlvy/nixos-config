{
  description = "flake";

  # nixConfig = {
  #   extra-substituters = [
  #     "https://hyprland.cachix.org"
  #   ];
  #   extra-trusted-public-keys = [
  #     "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
  #   ];
  # };

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs: {
    nixosConfigurations = {

      vmware = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";

        modules = [
          ./hosts/vmware

          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;

            home-manager.extraSpecialArgs = inputs;
            home-manager.users.nirlvy = import ./home;
          }
        ];
      };

    };

    formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.nixpkgs-fmt;

  };

}
