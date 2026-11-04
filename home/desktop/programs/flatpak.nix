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
      "com.usebottles.bottles"
      {
        appId = "org.gimp.GIMP";
        origin = "flathub-beta";
      }
    ];
    overrides = {
      "com.usebottles.bottles".Context = {
        # Use XWayland explicitly; fallback-x11 can hide DISPLAY in this session.
        sockets = [ "x11" "!fallback-x11" "!wayland" ];
      };
      global = {
        Context = {
          filesystems = [
            "/mnt/win-others"
            "/home/nirlvy/.local/share/fonts:ro"
            "/home/nirlvy/.icon:ro"
            "/home/nirlvy/.local/state/home-manager/gcroots/current-home/home-files/.local/share/icons/:ro"
            "${pkgs.capitaine-cursors}:ro"
          ];
        };
      };
    };
  };
}
