{
  documentation.nixos.enable = false;

  programs.appimage = {
    enable = true;
    binfmt = true;
  };

  programs.java = {
    enable = true;
    binfmt = true;
  };

  xdg.terminal-exec = {
    enable = true;
    settings = {
      default = [ "kitty.desktop" ];
    };
  };
}
