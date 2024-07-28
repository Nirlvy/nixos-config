{ inputs, ... }:
{
  nix = {
    channel.enable = false;

    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };

    nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];

    optimise.automatic = true;
    registry.nixpkgs.flake = inputs.nixpkgs;

    settings = {
      auto-optimise-store = true;
      builders-use-substitutes = true;
      keep-derivations = true;
      keep-outputs = true;
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      nix-path = [ "nixpkgs=${inputs.nixpkgs.outPath}" ];
      substituters = [
        "https://mirrors.ustc.edu.cn/nix-channels/store"
        "https://cache.nixos.org"

        "https://anyrun.cachix.org"
        "https://hyprland.cachix.org"
        "https://nirlvy.cachix.org"
        "https://nix-gaming.cachix.org"
      ];
      trusted-public-keys = [
        "anyrun.cachix.org-1:pqBobmOjI7nKlsUMV25u9QHa9btJK65/C8vnO3p346s="
        "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
        "nirlvy.cachix.org-1:dOdsWPG0r4JuqWy+p150yPiVrC28tELUZUdkXobrKZM="
        "nix-gaming.cachix.org-1:nbjlureqMbRAxR1gJ/f3hxemL9svXaZF/Ees8vCUUs4="
      ];
      trusted-users = [
        "root"
        "@wheel"
      ];
    };
  };

  nixpkgs = {
    config = {
      allowUnfree = true;
      permittedInsecurePackages = [ "openssl-1.1.1w" ];
    };
    flake = {
      setFlakeRegistry = false;
      setNixPath = false;
    };
    overlays = [ (import ../../overlays) ];
  };
}
