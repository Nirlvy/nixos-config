{ config, pkgs, ... }:
{
  services.dae = {
    enable = true;
    assets = with pkgs; [
      v2ray-geoip
      v2ray-domain-list-community
    ];
    configFile = config.age.secrets."config.dae".path;
  };
}
