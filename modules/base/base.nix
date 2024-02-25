{ pkgs, ... }:

{

  users.users.nirlvy = {
    isNormalUser = true;
    description = "Nirlvy";
    extraGroups = [
      "networkmanager"
      "wheel"
      "video"
      "adbusers"
    ];
    shell = pkgs.zsh;
  };

  nix.settings = {
    trusted-users = [ "Nirlvy" ];
    substituters = [
      "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store"
      "https://mirror.sjtu.edu.cn/nix-channels/store"
      "https://mirrors.ustc.edu.cn/nix-channels/store"
      "https://nix-community.cachix.org"
      "https://cache.nixos.org"
      "https://hyprland.cachix.org"
    ];
    trusted-public-keys = [
      "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    ];
    experimental-features = [ "nix-command" "flakes" ];
  };

}
