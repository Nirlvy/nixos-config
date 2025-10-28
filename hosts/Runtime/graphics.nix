{ pkgs, ... }:
{
  programs.nvidia.enable = true;

  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      libvdpau-va-gl
    ];
  };

  services.xserver.videoDrivers = [ "modesetting" ];
}
