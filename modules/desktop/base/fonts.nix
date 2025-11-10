{ pkgs, ... }:
{
  fonts = {
    fontDir.enable = true;
    enableDefaultPackages = false;
    packages = with pkgs; [
      font-awesome
      dejavu_fonts

      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
      noto-fonts-color-emoji

      # source-sans
      # source-serif
      # source-han-sans
      # source-han-serif

      # sarasa-gothic

      # jetbrains-mono
      jetbrains-maple-mono
      nerd-fonts.jetbrains-mono
    ];
    fontconfig = {
      defaultFonts = {
        serif = [
          "Noto Serif CJK SC"
          "Noto Color Emoji"
          "Font Awesome 7 Free"
        ];
        sansSerif = [
          "Noto Sans CJK SC"
          "Noto Color Emoji"
          "Font Awesome 7 Free"
        ];
        monospace = [
          "JetBrains Maple Mono"
          "Noto Color Emoji"
          "Font Awesome 7 Free"
        ];
        emoji = [
          "Noto Color Emoji"
          "Font Awesome 7 Free"
        ];
      };
    };
  };

  environment.systemPackages = [ pkgs.tela-icon-theme ];
}
