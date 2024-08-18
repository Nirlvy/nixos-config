{
  description = "Nirlvy's flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    # nur-nirlvy.url = "github:nirlvy/nur-packages";
    # debug
    nur-nirlvy.url = "/home/nirlvy/Documents/nur-packages";

    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    flake-parts.url = "github:hercules-ci/flake-parts";

    agenix = {
      url = "github:ryantm/agenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    anyrun = {
      url = "github:Kirottu/anyrun";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    honkai-railway-grub-theme.url = "github:voidlhf/StarRailGrubThemes";
    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
    impermanence.url = "github:nix-community/impermanence";
    niri = {
      url = "github:sodiboo/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-gaming.url = "github:fufexan/nix-gaming";
    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    secrets = {
      url = "git+ssh://git@github.com/Nirlvy/nix-secrets.git?shallow=1";
      flake = false;
    };
  };

  outputs =
    { flake-parts, ... }@inputs:
    flake-parts.lib.mkFlake { inherit inputs; } {
      debug = true;
      systems = [ "x86_64-linux" ];
      imports = [ ./hosts ];
    };
}
