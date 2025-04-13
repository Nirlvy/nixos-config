{ impermanence, ... }:
{
  imports = [ impermanence.nixosModules.impermanence ];

  environment.persistence."/persistent" = {
    enable = false;
    hideMounts = true;
    directories = [
      "/etc/NetworkManager/system-connections"
      "/etc/ssh"

      "/var/log"
      "/var/lib"
    ];
    files = [ "/etc/machine-id" ];

    users.nirlvy = {
      directories = [
        "Documents"
        "Downloads"
        "Music"
        "Pictures"
        "Videos"

        {
          directory = ".gnupg";
          mode = "0700";
        }
        {
          directory = ".ssh";
          mode = "0700";
        }

        ".conda"
        ".lingma"
        ".mozilla"
        ".pki"
        ".steam"
        ".vscode"
        ".var"
        ".xwechat"

        ".config/Code"
        ".config/fcitx5"
        ".config/obs-studio"
        ".config/obsidian"
        ".config/QQ"
        ".config/qqmusic"
        ".config/qt5ct"
        ".config/qt6ct"
        ".config/sops"
        ".config/Thunar"
        ".config/zsh"

        ".local/share"
        ".local/state"
      ];
      files = [ ".bash_history" ];
    };
  };
}
