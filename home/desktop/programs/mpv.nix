{
  lib,
  osConfig,
  pkgs,
  ...
}:
let
  highPf = true;
  hasNvidia = builtins.elem "nvidia" osConfig.services.xserver.videoDrivers;
in
{
  programs.mpv = {
    enable = true;
    defaultProfiles = [ "high-quality" ];
    scripts = with pkgs.mpvScripts; [
      thumbfast
      modernx-zydezu
    ];
    config = {
      # basic
      vo = "gpu-next";
      gpu-api = "auto";
      gpu-context = "auto";
      hwdec = "auto";
      # vd-lavc-dr = "yes";

      # function
      osc = "no";
      # border = "no";
      autofit-larger = "40%x30%";
      keep-open = "yes";
      idle = "yes";
      hr-seek = "yes";
      hr-seek-framedrop = "no";
      save-position-on-quit = "yes";
      write-filename-in-watch-later-config = "yes";
      resume-playback = "no";
      # resume-playback-check-mtime = "yes";
      # watch-later-dir = "~~/cache/watch-later";
      # watch-later-options = "start,vid,aid,sid";
      # watch-later-options-remove = "vf";
      save-watch-history = "yes";
      input-ipc-server = "/tmp/mpvsocket";

      # osd
      osd-bar = "no";
      osd-font = "Noto Sans Mono CJK SC";
      osd-font-size = "24";
      osd-duration = "2000";

      # video
      # icc-profile-auto = "yes";
      # icc-cache-dir = "~~/icc_cache";
      # video-sync = "display-resample";
      # interpolation = "yes";

      # audio
      audio-device = "auto";
      ao = "pipewire";
      audio-file-auto = "fuzzy";
      audio-pitch-correction = "yes";
      alang = "zh,chi,chs,sc,zho,en,eng";

      # sub
      sub-auto = "fuzzy";
      slang = "chs,sc,zh-CN,zh-Hans,cht,tc,zh-Hant,zh-HK,zh-TW,chi,zho,zh";

      # misc
      # vf = "format:dolbyvision=yes";
      # vf-append = "format=gamma=gamma2.2";
      gpu-shader-cache-dir = "~~/shaders_cache";
    };
    # CPU filters such as SVP need decoded frames in system memory.
    # Launch with: mpv --profile=svp <video>
    profiles.svp = {
      profile-desc = "Copy hardware-decoded frames to system memory for SVP";
      hwdec = "auto-copy";
    };
    # Anime4K is opt-in; use Ctrl+1..6 to select a mode and Ctrl+0 to clear it.
    extraInput = ''
      CTRL+0 no-osd change-list glsl-shaders clr ""; show-text "GLSL shaders cleared"
    ''
    + lib.optionalString (hasNvidia && highPf) ''
      # Optimized shaders for higher-end GPU:
      CTRL+1 no-osd change-list glsl-shaders set "~~/shaders/Anime4K_Clamp_Highlights.glsl:~~/shaders/Anime4K_Restore_CNN_VL.glsl:~~/shaders/Anime4K_Upscale_CNN_x2_VL.glsl:~~/shaders/Anime4K_AutoDownscalePre_x2.glsl:~~/shaders/Anime4K_AutoDownscalePre_x4.glsl:~~/shaders/Anime4K_Upscale_CNN_x2_M.glsl"; show-text "Anime4K: Mode A (HQ)"
      CTRL+2 no-osd change-list glsl-shaders set "~~/shaders/Anime4K_Clamp_Highlights.glsl:~~/shaders/Anime4K_Restore_CNN_Soft_VL.glsl:~~/shaders/Anime4K_Upscale_CNN_x2_VL.glsl:~~/shaders/Anime4K_AutoDownscalePre_x2.glsl:~~/shaders/Anime4K_AutoDownscalePre_x4.glsl:~~/shaders/Anime4K_Upscale_CNN_x2_M.glsl"; show-text "Anime4K: Mode B (HQ)"
      CTRL+3 no-osd change-list glsl-shaders set "~~/shaders/Anime4K_Clamp_Highlights.glsl:~~/shaders/Anime4K_Upscale_Denoise_CNN_x2_VL.glsl:~~/shaders/Anime4K_AutoDownscalePre_x2.glsl:~~/shaders/Anime4K_AutoDownscalePre_x4.glsl:~~/shaders/Anime4K_Upscale_CNN_x2_M.glsl"; show-text "Anime4K: Mode C (HQ)"
      CTRL+4 no-osd change-list glsl-shaders set "~~/shaders/Anime4K_Clamp_Highlights.glsl:~~/shaders/Anime4K_Restore_CNN_VL.glsl:~~/shaders/Anime4K_Upscale_CNN_x2_VL.glsl:~~/shaders/Anime4K_Restore_CNN_M.glsl:~~/shaders/Anime4K_AutoDownscalePre_x2.glsl:~~/shaders/Anime4K_AutoDownscalePre_x4.glsl:~~/shaders/Anime4K_Upscale_CNN_x2_M.glsl"; show-text "Anime4K: Mode A+A (HQ)"
      CTRL+5 no-osd change-list glsl-shaders set "~~/shaders/Anime4K_Clamp_Highlights.glsl:~~/shaders/Anime4K_Restore_CNN_Soft_VL.glsl:~~/shaders/Anime4K_Upscale_CNN_x2_VL.glsl:~~/shaders/Anime4K_AutoDownscalePre_x2.glsl:~~/shaders/Anime4K_AutoDownscalePre_x4.glsl:~~/shaders/Anime4K_Restore_CNN_Soft_M.glsl:~~/shaders/Anime4K_Upscale_CNN_x2_M.glsl"; show-text "Anime4K: Mode B+B (HQ)"
      CTRL+6 no-osd change-list glsl-shaders set "~~/shaders/Anime4K_Clamp_Highlights.glsl:~~/shaders/Anime4K_Upscale_Denoise_CNN_x2_VL.glsl:~~/shaders/Anime4K_AutoDownscalePre_x2.glsl:~~/shaders/Anime4K_AutoDownscalePre_x4.glsl:~~/shaders/Anime4K_Restore_CNN_M.glsl:~~/shaders/Anime4K_Upscale_CNN_x2_M.glsl"; show-text "Anime4K: Mode C+A (HQ)"
    ''
    + lib.optionalString (hasNvidia && !highPf) ''
      # Optimized shaders for lower-end GPU:
      CTRL+1 no-osd change-list glsl-shaders set "~~/shaders/Anime4K_Clamp_Highlights.glsl:~~/shaders/Anime4K_Restore_CNN_M.glsl:~~/shaders/Anime4K_Upscale_CNN_x2_M.glsl:~~/shaders/Anime4K_AutoDownscalePre_x2.glsl:~~/shaders/Anime4K_AutoDownscalePre_x4.glsl:~~/shaders/Anime4K_Upscale_CNN_x2_S.glsl"; show-text "Anime4K: Mode A (Fast)"
      CTRL+2 no-osd change-list glsl-shaders set "~~/shaders/Anime4K_Clamp_Highlights.glsl:~~/shaders/Anime4K_Restore_CNN_Soft_M.glsl:~~/shaders/Anime4K_Upscale_CNN_x2_M.glsl:~~/shaders/Anime4K_AutoDownscalePre_x2.glsl:~~/shaders/Anime4K_AutoDownscalePre_x4.glsl:~~/shaders/Anime4K_Upscale_CNN_x2_S.glsl"; show-text "Anime4K: Mode B (Fast)"
      CTRL+3 no-osd change-list glsl-shaders set "~~/shaders/Anime4K_Clamp_Highlights.glsl:~~/shaders/Anime4K_Upscale_Denoise_CNN_x2_M.glsl:~~/shaders/Anime4K_AutoDownscalePre_x2.glsl:~~/shaders/Anime4K_AutoDownscalePre_x4.glsl:~~/shaders/Anime4K_Upscale_CNN_x2_S.glsl"; show-text "Anime4K: Mode C (Fast)"
      CTRL+4 no-osd change-list glsl-shaders set "~~/shaders/Anime4K_Clamp_Highlights.glsl:~~/shaders/Anime4K_Restore_CNN_M.glsl:~~/shaders/Anime4K_Upscale_CNN_x2_M.glsl:~~/shaders/Anime4K_Restore_CNN_S.glsl:~~/shaders/Anime4K_AutoDownscalePre_x2.glsl:~~/shaders/Anime4K_AutoDownscalePre_x4.glsl:~~/shaders/Anime4K_Upscale_CNN_x2_S.glsl"; show-text "Anime4K: Mode A+A (Fast)"
      CTRL+5 no-osd change-list glsl-shaders set "~~/shaders/Anime4K_Clamp_Highlights.glsl:~~/shaders/Anime4K_Restore_CNN_Soft_M.glsl:~~/shaders/Anime4K_Upscale_CNN_x2_M.glsl:~~/shaders/Anime4K_AutoDownscalePre_x2.glsl:~~/shaders/Anime4K_AutoDownscalePre_x4.glsl:~~/shaders/Anime4K_Restore_CNN_Soft_S.glsl:~~/shaders/Anime4K_Upscale_CNN_x2_S.glsl"; show-text "Anime4K: Mode B+B (Fast)"
      CTRL+6 no-osd change-list glsl-shaders set "~~/shaders/Anime4K_Clamp_Highlights.glsl:~~/shaders/Anime4K_Upscale_Denoise_CNN_x2_M.glsl:~~/shaders/Anime4K_AutoDownscalePre_x2.glsl:~~/shaders/Anime4K_AutoDownscalePre_x4.glsl:~~/shaders/Anime4K_Restore_CNN_S.glsl:~~/shaders/Anime4K_Upscale_CNN_x2_S.glsl"; show-text "Anime4K: Mode C+A (Fast)"
    '';
  };

  xdg.configFile."mpv/shaders".source = pkgs.anime4k;

  home.packages = with pkgs; [ svp ];
}
