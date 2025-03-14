{
  programs.ghostty = {
    enable = true;
    settings = {
      font-size = 11;
      theme = "catppuccin-frappe";
      background-opacity = 0.8;
      background-blur = true;
      window-padding-x = 5;

      window-decoration = false;
      gtk-wide-tabs = false;

      mouse-hide-while-typing = true;

      clipboard-read = "allow";
      clipboard-write = "allow";
      copy-on-select = "clipboard";
      # wait #5995 merge
      app-notifications = "no-clipboard-copy";
      auto-update = "off";
    };
  };
}
