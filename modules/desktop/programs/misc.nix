{
  programs = {
    appimage = {
      enable = false;
      binfmt = true;
    };
    nano.enable = false;
    java = {
      enable = false;
      binfmt = true;
    };
  };

  xdg.terminal-exec = {
    enable = true;
    settings = {
      default = [ "ghostty.desktop" ];
    };
  };
}
