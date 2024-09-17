{
  lib,
  osConfig,
  pkgs,
  ...
}:
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
      hwdec = "auto-safe";
      vo = "gpu";
      gpu-context = "wayland";
    } // lib.mkIf (osConfig.programs.nvidia.enable) { hwdec = "auto-copy"; };
  };
}
