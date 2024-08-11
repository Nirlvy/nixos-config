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

  environment.systemPackages = with pkgs; [
    neovim
    git
    yazi

    rar
    p7zip
    unzip
    unar
    xz
    zip
    zstd

    file
    findutils
    gawk
    gnugrep
    gnused
    gnutar
    jq
    killall
    which
    tree
    rsync
    lsof

    bat
    fd
    lsd
    ripgrep
    zoxide

    bottom
    btop
    htop
    iotop
    # nvtopPackages.full
  ];

  environment = {
    variables = {
      EDITOR = "nvim";
      TERM = "xterm-256color";
    };
  };
}
