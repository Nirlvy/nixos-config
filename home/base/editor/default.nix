{
  programs = {
    neovim = {
      enable = true;
      defaultEditor = true;

      viAlias = true;
      vimAlias = true;
    };
  };

  xdg.configFile."nvim" = {
    source = ./nvim;
    recursive = true;
  };
}
