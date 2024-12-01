{
  description = "Nirlvy's flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nur-nirlvy.url = "github:nirlvy/nur-packages";
    # nur-nirlvy.url = "/home/nirlvy/Documents/nur-packages";
    secrets = {
      # url = "/home/nirlvy/Documents/nix-secrets";
      url = "git+ssh://git@github.com/Nirlvy/nix-secrets.git?shallow=1";
      flake = false;
    };

    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    flake-parts.url = "github:hercules-ci/flake-parts";

    agenix = {
      url = "github:ryantm/agenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    daeuniverse.url = "github:daeuniverse/flake.nix";
    # hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
    impermanence.url = "github:nix-community/impermanence";
    niri = {
      url = "github:sodiboo/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # nixos-cosmic.url = "github:lilyinstarlight/nixos-cosmic";
    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=v0.4.1";
    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # wezterm.url = "github:wez/wezterm?dir=nix";
  };

  outputs =
    { flake-parts, ... }@inputs:
    flake-parts.lib.mkFlake { inherit inputs; } {
      debug = true;
      systems = [ "x86_64-linux" ];
      imports = [ ./hosts ];
    };
}
