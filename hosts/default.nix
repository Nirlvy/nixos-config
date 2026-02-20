{ self, inputs, ... }:
{
  flake.nixosConfigurations =
    let
      nixosSystem = inputs.nixpkgs.lib.nixosSystem;
      mod = "${self}/modules";

      specialArgs = { inherit self inputs; };

      sharedModules = with inputs; [
        home-manager.nixosModules.home-manager

        {
          home-manager = {
            backupFileExtension = "bak";
            useGlobalPkgs = true;
            useUserPackages = true;
            extraSpecialArgs = specialArgs;
          };
        }

        "${mod}/base/base.nix"
        "${mod}/base/i18n.nix"
        "${mod}/base/misc.nix"
        "${mod}/base/nix-ld.nix"
        "${mod}/base/nix.nix"

        "${self}/secrets"
        "${self}/self-module"
      ];
    in
    {
      # NullPointer = nixosSystem {
      #   system = "x86_64-linux";
      #   inherit specialArgs;
      #   modules = [
      #     ./NullPointer

      #     "${mod}/base/network"
      #     "${mod}/base/memory.nix"

      #     "${mod}/desktop/programs/dm/ly.nix"
      #     "${mod}/desktop/niri.nix"

      #     { home-manager.users.nirlvy = "${self}/home/hosts/NullPointer.nix"; }
      #   ]
      #   ++ sharedModules;
      # };

      # WSL = nixosSystem {
      #   system = "x86_64-linux";
      #   inherit specialArgs;
      #   modules = [
      #     ./WSL

      #     { home-manager.users.nirlvy = "${self}/home/hosts/WSL.nix"; }
      #   ]
      #   ++ sharedModules;
      # };

      Runtime = nixosSystem {
        system = "x86_64-linux";
        inherit specialArgs;
        modules = [
          ./Runtime

          "${mod}/base/network"
          "${mod}/base/memory.nix"

          "${mod}/desktop/programs/dm/ly.nix"
          "${mod}/desktop/niri.nix"

          { home-manager.users.nirlvy = "${self}/home/hosts/Runtime.nix"; }
        ]
        ++ sharedModules;
      };
    };
}
