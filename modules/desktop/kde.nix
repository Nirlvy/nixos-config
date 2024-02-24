{ pkgs, inputs, ... }:

{

  imports = [
    ./fonts.nix
    ./media.nix
    ./dm
    # ./security.nix
    # ./virtualization.nix
  ];

  services.xserver.desktopManager.plasma5 = {
    enable = true;
    notoPackage = pkgs.noto-fonts-cjk;
  };

  environment.systemPackages = with pkgs; [
    sddm-kcm
  ];

  programs.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
  };

}
