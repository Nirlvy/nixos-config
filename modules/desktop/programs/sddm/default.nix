{ inputs, pkgs, ... }:
{
  environment.systemPackages = [
    (inputs.nur-nirlvy.packages.${pkgs.system}.sddm-sugar-candy.override { background = ./plana.jpg; })
  ];

  services = {
    xserver.enable = false;
    displayManager.sddm = {
      enable = true;
      wayland.enable = true;
      extraPackages = [
        # don't know why propagatedBuildInputs invaild
        pkgs.libsForQt5.qt5.qtgraphicaleffects
      ];
      autoNumlock = true;
      theme = "sugar-candy";
    };
  };
}
