{ inputs, pkgs, ... }:
let
  inherit (inputs) agenix secrets;
in
{
  imports = [ agenix.nixosModules.default ];
  environment.systemPackages = [ agenix.packages.${pkgs.system}.default ];
  age.identityPaths = [ "/etc/ssh/ssh_host_ed25519_key" ];

  age.secrets = {
    "config.dae".file = "${secrets}/config.dae";
    "passwd".file = "${secrets}/passwd.age";
  };
}
