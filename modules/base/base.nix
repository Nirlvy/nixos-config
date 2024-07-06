{ pkgs, ... }:
{
  users.users.nirlvy = {
    isNormalUser = true;
    extraGroups = [
      "networkmanager"
      "video"
      "wheel"
    ];
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHu883l55ki3mgiDfGRmN4H/3Pi1NXQkBAgCsvLhhvmH nirlvy@NullPointer"
    ];
    shell = pkgs.zsh;
  };

  security = {
    pam.services.hyprlock.text = "auth include login";
    sudo.wheelNeedsPassword = false;
  };

  environment.systemPackages = with pkgs; [
    neovim
    git

    rar
    p7zip
    unzip
    unar
    xz
    zip
    zstd

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
    bottom
    # nvtopPackages.full
  ];

  environment = {
    variables = {
      EDITOR = "nvim";
    };
    pathsToLink = [ "/share/zsh" ];
  };
}
