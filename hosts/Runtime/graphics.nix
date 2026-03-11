{
  config,
  pkgs,
  lib,
  ...
}:
{
  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      libvdpau-va-gl
    ];
  };

  services.xserver.videoDrivers = [ "nvidia" ];
  boot.kernelParams = [ "nvidia-drm.fbdev=1" ];
  hardware.nvidia = {
    open = true;
    package = config.boot.kernelPackages.nvidiaPackages.latest;
    modesetting.enable = true;
    powerManagement.enable = true;
  };

  hardware.nvidia-container-toolkit.enable = true;

  environment = {
    systemPackages = with pkgs; [ nvtopPackages.full ];
    sessionVariables = {
      LIBVA_DRIVER_NAME = lib.mkForce "nvidia";
    };
  };
}
