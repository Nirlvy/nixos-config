{ pkgs, ... }:
{
  programs.mihomo = {
    enable = true;
    tunMode = true;
    webui = pkgs.metacubexd;
    configFile = ./mihomo.yaml;
  };
}
