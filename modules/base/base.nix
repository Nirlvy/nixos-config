{ config, pkgs, ... }:
{
  users = {
    mutableUsers = true;
    users.nirlvy = {
      isNormalUser = true;
      extraGroups = [
        "networkmanager"
        "video"
        "wheel"
      ];
      # hashedPasswordFile = config.age.secrets.passwd.path;
      shell = pkgs.zsh;
    };
  };

  environment.systemPackages = with pkgs; [
    neovim
    git

    rar
    p7zip
    unzipNLS
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
    which
    # tree
    # rsync
    lsof

    bat
    fd
    ripgrep

    btop
    htop
    # iotop
  ];

  environment.variables = {
    EDITOR = "nvim";
    TERM = "xterm-256color";
  };
}
