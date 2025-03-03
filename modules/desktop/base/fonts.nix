{ pkgs, ... }:
{
  fonts = {
    fontDir.enable = true;

    packages = with pkgs; [
      font-awesome
      wqy_zenhei

      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
      noto-fonts-emoji

      # source-sans
      # source-serif
      # source-han-sans
      # source-han-serif

      corefonts
      vistafonts
      vistafonts-chs

      jetbrains-mono
      nerd-fonts.jetbrains-mono
    ];

    fontconfig.defaultFonts = {
      serif = [ "Noto Serif CJK SC" ];
      sansSerif = [ "Noto Sans CJK SC" ];
      monospace = [ "JetBrainsMono Nerd Font" ];
      emoji = [ "Noto Color Emoji" ];
    };
  };
}
