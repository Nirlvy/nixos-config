{

  programs = {

    helix = {
      enable = true;
      defaultEditor = true;
      settings = {
        theme = "tokyonight_storm";
      };
    };

    neovim = {
      enable = true;
      defaultEditor = false;

      viAlias = true;
      vimAlias = true;

      coc.enable = true;

      withNodeJs = true;
      withPython3 = true;
    };

  };

}
