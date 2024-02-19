{ pkgs, ... }:

{

  environment.systemPackages = with pkgs; [
    (callPackage ./sddm-sugar-candy.nix {})
  ];


  services.xserver = {

    enable = true;
    displayManager.sddm = {
      enable = true;
      wayland.enable = true;
      autoNumlock = true;
      theme = "Sugar-candy";
    };

  };

}
