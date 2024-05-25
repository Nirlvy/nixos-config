{
  pkgs,
  inputs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    inputs.nur-nirlvy.packages.${system}.sddm-sugar-candy
    libsForQt5.qt5.qtgraphicaleffects
  ];

  services = {
    xserver.enable = true;
    displayManager.sddm = {
      enable = true;
      wayland.enable = false;
      autoNumlock = true;
      theme = "sugar-candy";
    };
  };
}
