{
  description = "Nirlvy's flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    # nixos-wsl = {
    #   url = "github:nix-community/NixOS-WSL/main";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
    secrets = {
      url = "github:Nirlvy/nix-secrets";
      flake = false;
    };

    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    flake-parts.url = "github:hercules-ci/flake-parts";

    agenix = {
      url = "github:ryantm/agenix";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        home-manager.follows = "home-manager";
        darwin.follows = "";
      };
    };
    daeuniverse = {
      url = "github:daeuniverse/flake.nix";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-parts.follows = "flake-parts";
    };
    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=latest";
    niri = {
      url = "github:sodiboo/niri-flake";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        xwayland-satellite-stable.follows = "";
        xwayland-satellite-unstable.follows = "xwayland-satellite";
      };
    };
    noctalia.url = "github:noctalia-dev/noctalia/cachix";
    xwayland-satellite = {
      url = "github:Supreeeme/xwayland-satellite";
      inputs.nixpkgs.follows = "nixpkgs";
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
