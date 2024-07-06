{ self, inputs, ... }:
{
  flake.nixosConfigurations =
    let
      nixosSystem = inputs.nixpkgs.lib.nixosSystem;
      mod = "${self}/modules";

      specialArgs = {
        inherit self inputs;
      };

      sharedModules = with inputs; [
        home-manager.nixosModules.home-manager
        sops-nix.nixosModules.sops
      ];
    in
    {
      NullPointer = nixosSystem {
        system = "x86_64-linux";
        inherit specialArgs;
        modules = [
          ./NullPointer

          "${mod}/base/base.nix"
          "${mod}/base/i18n.nix"
          "${mod}/base/misc.nix"
          "${mod}/base/network.nix"
          "${mod}/base/nix.nix"
          "${mod}/base/ssh.nix"

          "${mod}/desktop/hyprland.nix"

          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = false;
              users.nirlvy = "${self}/home/hosts/NullPointer.nix";
              extraSpecialArgs = specialArgs;
            };
          }
        ] ++ sharedModules;
      };
    };
}
