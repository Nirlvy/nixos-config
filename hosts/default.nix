{ self, inputs, ... }:
{
  flake.nixosConfigurations =
    let
      nixosSystem = inputs.nixpkgs.lib.nixosSystem;
      mod = "${self}/modules";

      specialArgs = { inherit self inputs; };

      sharedModules = with inputs; [
        home-manager.nixosModules.home-manager

        "${mod}/base/base.nix"
        "${mod}/base/i18n.nix"
        "${mod}/base/misc.nix"
        "${mod}/base/nix-ld.nix"
        "${mod}/base/nix.nix"

        "${self}/secrets"
      ];
    in
    {
      NullPointer = nixosSystem {
        system = "x86_64-linux";
        inherit specialArgs;
        modules = [
          ./NullPointer

          "${mod}/base/network"

          "${mod}/base/memory.nix"
          "${mod}/base/nvidia.nix"

          "${mod}/desktop/niri.nix"

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

      WSL = nixosSystem {
        system = "x86_64-linux";
        inherit specialArgs;
        modules = [
          ./WSL

          {
            home-manager = {
              backupFileExtension = "bak";
              useGlobalPkgs = true;
              useUserPackages = true;
              users.nirlvy = "${self}/home/hosts/WSL.nix";
              extraSpecialArgs = specialArgs;
            };
          }
        ] ++ sharedModules;
      };
    };
}
