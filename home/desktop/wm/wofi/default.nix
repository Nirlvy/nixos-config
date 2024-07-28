{
  programs.wofi = {
    enable = true;
    style = builtins.readFile ./style.css;
  };

  xdg.configFile."wofi" = {
    source = ./fc;
    recursive = true;
    executable = true;
  };
}
