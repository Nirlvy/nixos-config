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
    ];
    overrides = {
      global = {
        Context.fileSystems = [
          "/home/nirlvy/.local/share/fonts:ro"
          "/home/nirlvy/.icon:ro"
          "/nix/store:ro"
        ];
        Context.sockets = [
          "wayland"
          "!x11"
          "!fallback-x11"
        ];
      };

      "com.qq.QQmusic".Context.sockets = [ "x11" ];
      "com.tencent.WeChat".Context.sockets = [ "x11" ];
    };
  };
}
