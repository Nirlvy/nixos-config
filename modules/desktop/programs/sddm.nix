{ inputs, pkgs, ... }:
{
  environment.systemPackages = [
    inputs.nur-nirlvy.packages.${pkgs.system}.sddm-sugar-candy
    pkgs.libsForQt5.qt5.qtgraphicaleffects
  ];

  services = {
    xserver.enable = false;
    displayManager.sddm = {
      enable = true;
      wayland.enable = true;
      autoNumlock = true;
      theme = "sugar-candy";
    };
  };
}
