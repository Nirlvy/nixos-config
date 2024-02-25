{ pkgs, ... }:

{

  environment.systemPackages = with pkgs; [
    (callPackage ./sddm-sugar-candy.nix { })
    libsForQt5.qt5.qtgraphicaleffects
  ];


  services.xserver = {

    enable = true;

    displayManager.sddm = {
      enable = true;
      wayland.enable = false;
      autoNumlock = true;
      theme = "sugar-candy";
    };

  };

}
