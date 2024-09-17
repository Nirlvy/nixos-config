{
  programs.fuzzel = {
    enable = true;
    settings = {
      main = {
        font = "Noto Sans CJK SC";
      };
      colors = {
        background = "303446dd";
        text = "c6d0f5ff";
        match = "99d1dbff";
        selection = "626880ff";
        selection-match = "99d1dbff";
        selection-text = "c6d0f5ff";
        border = "babbf1ff";
      };
    };
  };

  xdg.configFile."fuzzel/power.sh" = {
    source = ./power.sh;
    executable = true;
  };
}
