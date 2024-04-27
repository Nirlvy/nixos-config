{
  lib,
  pkgs,
  ...
}: {
  nixpkgs.config.allowUnfree = lib.mkForce true;

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

    bat
    fd
    lsd
    ripgrep
    zoxide

    iotop
    btop
    htop
    nvtopPackages.full
  ];

  environment = {
    variables = {
      EDITOR = "nvim";
    };
    pathsToLink = ["/share/zsh"];
  };

  documentation.nixos.enable = false;

  programs.zsh.enable = true;

  programs.adb.enable = true;
}
