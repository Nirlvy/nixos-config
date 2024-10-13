{ config, pkgs, ... }:
{
  users = {
    mutableUsers = false;
    users.nirlvy = {
      isNormalUser = true;
      extraGroups = [
        "networkmanager"
        "video"
        "wheel"
      ];
      hashedPasswordFile = config.age.secrets.passwd.path;
      shell = pkgs.zsh;
    };
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
    fzf
    lsd
    ripgrep

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
