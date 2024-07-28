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

}
