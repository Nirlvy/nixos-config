{
  disabledModules = [ "services/display-managers/sddm.nix" ];

  imports = [
    ./nvidia.nix
    ./sddm.nix
  ];
}
