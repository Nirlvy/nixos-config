{
  programs.kitty = {
    enable = false;
    themeFile = "Catppuccin-Macchiato";
    extraConfig = ''
      font_family      JetBrainsMono Nerd Font
      bold_font        auto
      italic_font      auto
      bold_italic_font auto

      font_size 11.0

      cursor_shape beam 
      cursor_blink_interval 0.5

      copy_on_select yes

      enable_audio_bell no

      hide_window_decorations titlebar-only
      window_padding_width    5
      background_opacity      0.8
      background_blur         30

      tab_bar_edge  top
      tab_bar_style powerline

      map ctrl+shift+[ previous_tab
      map ctrl+shift+] next_tab
    '';
  };
}
