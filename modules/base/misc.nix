{ lib, pkgs, ... }:

{

  nixpkgs.config.allowUnfree = lib.mkForce true;

  nix = {

    
  };

  zramSwap.enable = true;

  environment.systemPackages = with pkgs; [

    neovim
    git

    zip
    xz
    zstd
    unzip
    p7zip
    unar

    gnugrep
    gnused
    gawk
    killall
    file
    findutils
    which
    tree
    gnutar
    rsync
    lsof

    iotop
    btop
    htop

  ];

  environment = {
    variables = {
      EDITOR = "nvim";
    };
    pathsToLink = [ "/share/zsh" ];
  };

  services = {
    v2raya.enable = true;
    # resolved.enable = true;
  };

  documentation.nixos.enable = false;

  programs.zsh.enable = true;

  programs.adb.enable = true;

}
