{
  documentation.nixos.enable = false;

  programs.appimage = {
    enable = false;
    binfmt = true;
  };

  programs.java = {
    enable = false;
    binfmt = true;
  };

  xdg.terminal-exec = {
    enable = true;
    settings = {
      default = [ "ghostty.desktop" ];
    };
  };
}
