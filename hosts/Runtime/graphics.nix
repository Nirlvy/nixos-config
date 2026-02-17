{ config,pkgs,lib, ... }:
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
    package =
    let
      base = config.boot.kernelPackages.nvidiaPackages.latest;
      cachyos-nvidia-patch = pkgs.fetchpatch {
        url = "https://raw.githubusercontent.com/CachyOS/CachyOS-PKGBUILDS/master/nvidia/nvidia-utils/kernel-6.19.patch";
        sha256 = "sha256-YuJjSUXE6jYSuZySYGnWSNG5sfVei7vvxDcHx3K+IN4=";
      };
      driverAttr = if config.hardware.nvidia.open then "open" else "bin";
    in
    base
    // {
      ${driverAttr} = base.${driverAttr}.overrideAttrs (oldAttrs: {
        patches = (oldAttrs.patches or [ ]) ++ [ cachyos-nvidia-patch ];
      });
    };
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
