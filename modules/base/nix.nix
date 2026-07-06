{ inputs, pkgs, ... }@args:
{
  nix = {
    channel.enable = false;

    optimise.automatic = true;
    registry.nixpkgs.flake = inputs.nixpkgs;

    package = pkgs.lix;

    settings = {
      auto-optimise-store = true;
      builders-use-substitutes = true;
      keep-derivations = true;
      keep-outputs = true;
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      nix-path = [ "nixpkgs=${inputs.nixpkgs}" ];
      substituters = [
        "https://mirror.nju.edu.cn/nix-channels/store?priority=10"
        "https://mirrors.ustc.edu.cn/nix-channels/store?priority=20"
        # "https://mirrors.ustc.edu.cn/nix-channels/store"
        "https://cache.nixos-cuda.org?priority=30"
        "https://noctalia.cachix.org"
      ];
      trusted-public-keys = [
        "cache.nixos-cuda.org:74DUi4Ye579gUqzH4ziL9IyiJBlDpMRn9MBN8oNan9M="
        "noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4="
      ];
      trusted-users = [ "@wheel" ];
      warn-dirty = false;
    };
  };

  nixpkgs = {
    config = {
      allowUnfree = true;
      permittedInsecurePackages = [ ];
    };
    overlays = [ ] ++ (import ../../overlays args);
  };

  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keep-since 7d --keep 5";
    flake = "/etc/nixos";
  };
}
