{inputs, ...}: {
  nix = {
    settings = {
      trusted-users = ["root" "@wheel"];
      substituters = [
        "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store"
        "https://mirror.sjtu.edu.cn/nix-channels/store"
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

      experimental-features = ["nix-command" "flakes"];
      auto-optimise-store = true;
      builders-use-substitutes = true;
      keep-derivations = true;
      keep-outputs = true;
      nix-path = "nixpkgs=/etc/nix/inputs/nixpkgs";
    };

    channel.enable = false;
    registry.nixpkgs.flake = inputs.nixpkgs;

    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };

  nixpkgs = {
    config = {
      allowUnfree = true;
      permittedInsecurePackages = [
        "openssl-1.1.1w"
      ];
    };

    overlays = [
      (import ../../overlays)
    ];
  };
}
