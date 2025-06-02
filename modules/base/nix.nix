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
        "https://mirrors.ustc.edu.cn/nix-channels/store"
        "https://nix-community.cachix.org"
        "https://cache.garnix.io"
      ];
      trusted-public-keys = [
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
        "cache.garnix.io:CTFPyKSLcx5RMJKfLo5EEPUObbA78b0YQ2DTCJXqr9g="
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

  # https://github.com/nix-community/nh/issues/278
  environment.sessionVariables = {
    NH_NO_CHECKS = "1";
  };
}
