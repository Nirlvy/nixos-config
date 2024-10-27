{ inputs, ... }:
{
  imports = [ inputs.nix-flatpak.homeManagerModules.nix-flatpak ];

  services.flatpak = {
    remotes = [
      {
        name = "flathub";
        location = "https://mirror.sjtu.edu.cn/flathub/flathub.flatpakrepo";
      }
    ];
    update.auto.enable = true;

    packages = [
      "com.github.tchx84.Flatseal"
      "com.qq.QQmusic"
      "com.tencent.WeChat"
      "io.github.zen_browser.zen"
    ];
    overrides = {
      global = {
        Context.sockets = [
          "wayland"
          "!x11"
          "!fallback-x11"
        ];

        Environment = {
          XCURSOR_PATH = "/run/host/user-share/icons:/run/host/share/icons";
        };
      };

      "com.qq.QQmusic".Context.sockets = [ "x11" ];
      "com.tencent.WeChat".Context.sockets = [ "x11" ];
    };
  };
}
