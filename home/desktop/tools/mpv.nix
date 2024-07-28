{ pkgs, ... }:
{
  programs.mpv = {
    enable = true;
    defaultProfiles = [ "gpu-hq" ];
    scripts = with pkgs.mpvScripts; [
      thumbfast
      modernx-zydezu
    ];
    config = {
      osc = "no";
      border = "no";
    };
  };
}
