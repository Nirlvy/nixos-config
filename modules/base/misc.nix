{ lib, pkgs, ... }:

{

  nixpkgs.config.allowUnfree = lib.mkForce true;

  nix = {

    gc = {
      automatic = lib.mkDefault true;
      dates = lib.mkDefault "weekly";
      options = lib.mkDefault "--delete-older-than 7d";
    };

    settings.auto-optimise-store = true;
  };

  zramSwap.enable = true;

  environment.systemPackages = with pkgs; [

    neofetch
    neovim
    helix
    git

    zip
    xz
    zstd
    unzip
    p7zip

    gnugrep
    gnused
    gawk

    lsof

    iotop
    btop
    htop

    file
    findutils
    which
    tree
    gnutar
    rsync

    wget
    curl

  ];

  environment.variables.EDITOR = "helix";
  environment.pathsToLink = [ "/share/zsh" ];

  services = {
    v2raya.enable = true;
    xserver.desktopManager.xterm.enable = false;
    resolved.enable = true;
  };

  documentation.nixos.enable = false;

  programs.nautilus-open-any-terminal = {
    enable = true;
    terminal = "alacritty";
  };
}
