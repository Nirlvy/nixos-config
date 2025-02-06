{
  programs.ghostty = {
    enable = true;
    settings = {
      font-size = 11;
      theme = "catppuccin-frappe";
      background-opacity = 0.8;
      window-padding-x = 5;

      window-decoration = false;
      gtk-wide-tabs = false;

      mouse-hide-while-typing = true;

      clipboard-read = "allow";
      clipboard-write = "allow";
      copy-on-select = "clipboard";
      auto-update = "off";
    };
  };
}
