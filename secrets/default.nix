{ inputs, pkgs, ... }:
let
  inherit (inputs) agenix secrets;
in
{
  imports = [ agenix.nixosModules.default ];
  environment.systemPackages = [
    # rage build失败
    agenix.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];
  age.identityPaths = [ "/etc/ssh/ssh_host_ed25519_key" ];

  age.secrets = {
    "passwd".file = "${secrets}/passwd.age";
    "sub".file = "${secrets}/sub.age";
  };
}
