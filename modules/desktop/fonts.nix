{ pkgs, ... }:
{
  fonts = {
    fontDir.enable = true;

    packages = with pkgs; [
      font-awesome

      noto-fonts-cjk
      noto-fonts-emoji

      source-sans
      source-serif
      source-han-sans
      source-han-serif

      jetbrains-mono

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
