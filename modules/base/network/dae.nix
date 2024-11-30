{
  config,
  inputs,
  pkgs,
  ...
}:
{
  imports = with inputs; [ daeuniverse.nixosModules.dae ];

  services.dae = {
    enable = true;
    config = ''
      include {
        configFull.dae
      }'';
  };

  environment.etc."dae/configFull.dae" = {
    text = ''
      global {
          log_level: info
          wan_interface: auto
          auto_config_kernel_parameter: true
      }

      subscription {
          sub: '@sub-link@'
      }

      dns {
          upstream {
              alidns: 'udp://dns.alidns.com:53'
              googledns: 'tcp+udp://dns.google.com:53'
          }
          routing {
              request {
                  qname(geosite:category-ads-all) -> reject
                  qname(geosite:google@cn) -> alidns 
                  qname(suffix: com, keyword: google) -> googledns
                  fallback: asis
              }
              response {
                  upstream(googledns) -> accept
                  ip(geoip:private) && !qname(geosite:cn) -> googledns
                  fallback: accept
              }
          }
      }

      group {
          group {
              # filter: name(keyword: '高')
              policy: min_avg10
              policy: random
          }
      }

      routing {
          pname(NetworkManager) -> direct
          dip(geoip:private) -> direct

          # Disable h3 because it usually consumes too much cpu/mem resources.
          l4proto(udp) && dport(443) -> block
          dip(geoip:cn) -> direct
          domain(geosite:cn) -> direct

          # waydroid
          # sport(53) -> group
          # sport(67) -> group

          fallback: group
      }'';
    mode = "0600";
  };

  system.activationScripts."sub-link" = ''
    secret=$(cat "${config.age.secrets.sub-link.path}")
    configFile=/etc/dae/configFull.dae
    ${pkgs.gnused}/bin/sed -i "s#@sub-link@#$secret#" "$configFile"
  '';
}
