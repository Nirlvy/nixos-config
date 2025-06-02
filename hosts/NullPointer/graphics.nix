{ pkgs, ... }:
{
  programs.nvidia.enable = true;

  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      intel-media-driver # LIBVA_DRIVER_NAME=iHD
      intel-media-sdk
      intel-compute-runtime-legacy1
      # intel-vaapi-driver # LIBVA_DRIVER_NAME=i965 (older but works better for Firefox/Chromium)
      libvdpau-va-gl
    ];
    extraPackages32 = with pkgs.pkgsi686Linux; [ intel-vaapi-driver ];
  };

  services.xserver.videoDrivers = [ "modesetting" ];

  environment.sessionVariables = {
    LIBVA_DRIVER_NAME = "iHD";
  }; # Force intel-media-driver
}
