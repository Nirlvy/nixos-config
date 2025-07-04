{ inputs, pkgs, ... }:
let
  inherit (inputs) agenix secrets;
in
{
  imports = [ agenix.nixosModules.default ];
  environment.systemPackages = [
    (agenix.packages.${pkgs.system}.default.override { ageBin = "${pkgs.rage}/bin/rage"; })
  ];
  age.identityPaths = [ "/etc/ssh/ssh_host_ed25519_key" ];

  age.secrets = {
    "passwd".file = "${secrets}/passwd.age";
    "sub".file = "${secrets}/sub.age";
    "sub.yaml".file = "${secrets}/sub.yaml.age";
  };
}
