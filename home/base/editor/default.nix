{ config, pkgs, ... }:
{
  programs = {
    neovim = {
      enable = true;
      defaultEditor = true;
      sideloadInitLua = true;
      viAlias = true;
      vimAlias = true;
      withNodeJs = true;
      withPython3 = false;
      withRuby = false;
      extraPackages = with pkgs; [ gcc ];
    };
  };

  xdg.configFile."nvim".source = config.lib.file.mkOutOfStoreSymlink /etc/nixos/home/base/editor/nvim;

  # Stable path for editors and language servers to find Neovim's Lua runtime.
  xdg.dataFile."nvim/runtime".source = "${config.programs.neovim.package}/share/nvim/runtime";
}
