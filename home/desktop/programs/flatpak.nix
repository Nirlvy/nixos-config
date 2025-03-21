{ inputs, pkgs, ... }:
{
  imports = [ inputs.nix-flatpak.homeManagerModules.nix-flatpak ];

  services.flatpak = {
    remotes = [
      {
        name = "flathub";
        location = "https://mirror.sjtu.edu.cn/flathub/flathub.flatpakrepo";
      }
      {
        name = "flathub-beta";
        location = "https://flathub.org/beta-repo/flathub-beta.flatpakrepo";
      }
    ];
    update.auto.enable = true;
    uninstallUnmanaged = true;

    packages = [
      "com.github.tchx84.Flatseal"
      "com.qq.QQmusic"
      "com.tencent.WeChat"

      {
        appId = "org.gimp.GIMP";
        origin = "flathub-beta";
      }
    ];
    overrides = {
      global = {
        Context = {
          filesystems = [
            "/home/nirlvy/.local/share/fonts:ro"
            "/home/nirlvy/.icon:ro"
            "/home/nirlvy/.local/state/home-manager/gcroots/current-home/home-files/.local/share/icons/:ro"
            "${pkgs.capitaine-cursors}:ro"
          ];
          sockets = [
            "wayland"
            "!x11"
            "!fallback-x11"
          ];
        };
      };

      "com.qq.QQmusic".Context.sockets = [
        "!wayland"
        "x11"
        "!fallback-x11"
      ];
      "com.tencent.WeChat".Context.sockets = [
        "!wayland"
        "x11"
        "!fallback-x11"
      ];
    };
  };
}
