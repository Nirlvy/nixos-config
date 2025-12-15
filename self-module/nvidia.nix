{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.programs.nvidia;
in
{
  options.programs.nvidia = with lib; {
    enable = mkEnableOption "Nvidia driver";
  };

  config = lib.mkIf cfg.enable {
    services.xserver.videoDrivers = [ "nvidia" ];
    boot.kernelParams=[ "nvidia-drm.fbdev=1" ];

    hardware.nvidia = {
      dynamicBoost.enable = false;
      modesetting.enable = true;
      powerManagement.enable = true;
      powerManagement.finegrained = false;
      open = true;
      nvidiaSettings = false;
      package = config.boot.kernelPackages.nvidiaPackages.beta;
      prime = {
        sync.enable = false;
        intelBusId = "PCI:0:2:0";
        nvidiaBusId = "PCI:1:0:0";
      };
    };

    hardware.nvidia-container-toolkit.enable = true;

    environment = {
      systemPackages = with pkgs; [ nvtopPackages.full ];
      sessionVariables = {
        LIBVA_DRIVER_NAME = lib.mkForce "nvidia";
      };
    };

    # specialisation = {
    #   on-the-go.configuration = {
    #     system.nixos.tags = [ "on-the-go" ];
    #     hardware.nvidia = {
    #       prime.offload.enable = lib.mkForce true;
    #       prime.offload.enableOffloadCmd = lib.mkForce true;
    #       prime.sync.enable = lib.mkForce false;
    #       # Experimental
    #       powerManagement.enable = lib.mkForce true;
    #       powerManagement.finegrained = lib.mkForce true;
    #     };
    #   };
    # };
  };

}
