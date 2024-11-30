{ config, ... }:
{
  programs = {
    neovim = {
      enable = true;
      defaultEditor = true;

      viAlias = true;
      vimAlias = true;
    };
  };

  xdg.configFile."nvim/lua" = {
    source = config.lib.file.mkOutOfStoreSymlink ./nvim/lua;
    recursive = true;
  };

  xdg.configFile."nvim/init.lua".source = config.lib.file.mkOutOfStoreSymlink ./nvim/init.lua;

}
