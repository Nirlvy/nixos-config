{
  description = "Nirlvy's flake";

  nixConfig = {
    extra-substituters = [
      "https://hyprland.cachix.org"
      "https://nix-gaming.cachix.org"
      "https://anyrun.cachix.org"
      "https://nirlvy.cachix.org"
    ];
    extra-trusted-public-keys = [
      "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
      "nix-gaming.cachix.org-1:nbjlureqMbRAxR1gJ/f3hxemL9svXaZF/Ees8vCUUs4="
      "anyrun.cachix.org-1:pqBobmOjI7nKlsUMV25u9QHa9btJK65/C8vnO3p346s="
      "nirlvy.cachix.org-1:dOdsWPG0r4JuqWy+p150yPiVrC28tELUZUdkXobrKZM="
    ];
  };

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nur-nirlvy.url = "github:nirlvy/nur-packages";

    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    flake-parts.url = "github:hercules-ci/flake-parts";

    agenix = {
      url = "github:ryantm/agenix";
      inputs.home-manager.follows = "home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    anyrun = {
      url = "github:Kirottu/anyrun";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    honkai-railway-grub-theme.url = "github:voidlhf/StarRailGrubThemes";
    nixd = {
      url = "github:nix-community/nixd";
      inputs.flake-parts.follows = "flake-parts";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-alien = {
      url = "github:thiagokokada/nix-alien";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-gaming.url = "github:fufexan/nix-gaming";
    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    pre-commit-hooks = {
      url = "github:cachix/pre-commit-hooks.nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    flake-parts,
    ...
  } @ inputs:
    flake-parts.lib.mkFlake {inherit inputs;} {
      debug = true;
      systems = [
        "x86_64-linux"
      ];

      imports = [
        ./hosts
        ./pre-commit-hooks.nix
      ];

      perSystem = {
        config,
        system,
        pkgs,
        ...
      }: {
        formatter = pkgs.alejandra;
      };
    };
}
