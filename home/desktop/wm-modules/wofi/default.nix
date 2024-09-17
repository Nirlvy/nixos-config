{
  programs.wofi = {
    enable = false;
    style = builtins.readFile ./style.css;
  };

  xdg.configFile."wofi" = {
    source = ./fc;
    recursive = true;
    executable = true;
  };
}
