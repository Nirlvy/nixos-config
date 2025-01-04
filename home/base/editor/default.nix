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

  xdg.configFile."nvim".source = config.lib.file.mkOutOfStoreSymlink /etc/nixos/home/base/editor/nvim;
}
