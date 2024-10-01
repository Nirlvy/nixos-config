{ self, inputs, ... }:
{
  flake.nixosConfigurations =
    let
      nixosSystem = inputs.nixpkgs.lib.nixosSystem;
      mod = "${self}/modules";

      specialArgs = {
        inherit self inputs;
      };

      sharedModules = with inputs; [ home-manager.nixosModules.home-manager ];
    in
    {
      NullPointer = nixosSystem {
        system = "x86_64-linux";
        inherit specialArgs;
        modules = [
          ./NullPointer

          "${mod}/base/"
          # "${mod}/desktop/cosmic.nix"
          # "${mod}/desktop/hyprland.nix"
          "${mod}/desktop/niri.nix"

          "${self}/secrets"

          {
            home-manager = {
              backupFileExtension = "bak";
              useGlobalPkgs = true;
              useUserPackages = true;
              users.nirlvy = "${self}/home/hosts/NullPointer.nix";
              extraSpecialArgs = specialArgs;
            };
          }
        ] ++ sharedModules;
      };
    };
}
