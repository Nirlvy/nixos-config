{ lib, ... }:
{
  services.swaync.enable = true;
  xdg.configFile."swaync/config.json".source = lib.mkForce ./config.json;
  xdg.configFile."swaync/style.css".source = lib.mkForce ./style.css;
}
