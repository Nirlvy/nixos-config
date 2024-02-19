{ config, ... }:

let
  isKde = if (config.networking.hostName == "vmware") then [ ./kde.nix ] else [ ];
in

{

  imports = [
    ./fonts.nix
    ./media.nix
    ./common.nix
    ./dm
    ./fcitx5.nix
    # ./xdg.nix
    # ./security.nix
    # ./virtualization.nix
  ] ++ isKde;

}
