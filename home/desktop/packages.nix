{ pkgs, ... }:
{
  home.packages = with pkgs; [
    lxqt.lximage-qt

    qq

    (
      # let
      #   vmoptions = ''
      #     --add-opens=java.base/jdk.internal.org.objectweb.asm=ALL-UNNAMED
      #     --add-opens=java.base/jdk.internal.org.objectweb.asm.tree=ALL-UNNAMED
      #     -javaagent:${pkgs.callPackage "${self}/pkgs/ja-netfilter.nix" { }}/ja-netfilter.jar=jetbrains
      #     -Dawt.toolkit.name=WLToolkit
      #   '';
      let
        jetbra = pkgs.fetchFromGitHub {
          owner = "WhyFeelSad";
          repo = "jetbra";
          rev = "631a187dfe45652f23a0d0b0a030abccc6c648f9";
          sha256 = "sha256-FvjwrmRE9xXkDIIkOyxVEFdycYa/t2Z0EgBueV+26BQ=";
        };
        # https://jetbra.in/5d84466e31722979266057664941a71893322460
        vmoptions = ''
          --add-opens=java.base/jdk.internal.org.objectweb.asm=ALL-UNNAMED
          --add-opens=java.base/jdk.internal.org.objectweb.asm.tree=ALL-UNNAMED
          -javaagent:${jetbra}/ja-netfilter.jar=jetbrains
        '';

      in
      jetbrains.idea-ultimate.override {
        vmopts = vmoptions;
      }

    )
    telegram-desktop
    obsidian
    obs-studio
    vscode-fhs
    zed-editor

    distrobox
    qjournalctl
    filelight

    winetricks
    wineWowPackages.wayland
  ];
}
