{ pkgs, ... }:
{
  fonts = {
    fontDir.enable = true;

    packages = with pkgs; [
      font-awesome

      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
      noto-fonts-emoji

      source-sans
      source-serif
      source-han-sans
      source-han-serif

      jetbrains-mono

      wqy_microhei
      wqy_zenhei

      (nerdfonts.override {
        fonts = [
          "JetBrainsMono"
          "FiraCode"
        ];
      })
    ];

    fontconfig.defaultFonts = {
      serif = [ "Noto Serif CJK SC" ];
      sansSerif = [ "Noto Sans CJK SC" ];
      monospace = [ "JetBrainsMono Nerd Font" ];
      emoji = [ "Noto Color Emoji" ];
    };
  };
}
