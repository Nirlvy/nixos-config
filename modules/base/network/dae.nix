{
  config,
  inputs,
  pkgs,
  ...
}:
{
  imports = with inputs; [
    daeuniverse.nixosModules.dae
    daeuniverse.nixosModules.daed
  ];

  services.dae = {
    enable = true;
    assets = with pkgs; [
      v2ray-geoip
      v2ray-domain-list-community
    ];
    configFile = config.age.secrets."config.dae".path;
  };

  services.daed.enable = true;
}
