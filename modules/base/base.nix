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

  environment.systemPackages =
    with pkgs;
    [
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
      which
      tree
      rsync
      lsof

      bat
      fd
      ripgrep

      btop
      htop
      iotop
    ]
    ++ [ (if config.programs.nvidia.enable == true then nvtopPackages.full else null) ];

  environment.variables = {
    EDITOR = "nvim";
    TERM = "xterm-256color";
  };
}
