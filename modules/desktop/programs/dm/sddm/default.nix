{ pkgs, ... }:
{
  environment.systemPackages = [ (pkgs.sddm-eucalyptus-drop.override { background = ./plana.jpg; }) ];

  services = {
    xserver.enable = false;
    displayManager.sddm = {
      enable = true;
      package = pkgs.kdePackages.sddm;
      wayland.enable = true;
      extraPackages = [ pkgs.kdePackages.qt5compat ];
      autoNumlock = true;
      theme = "eucalyptus-drop";
    };
  };
}
