{ config, inputs, ... }:
{
  imports = with inputs; [ daeuniverse.nixosModules.dae ];

  services.dae = {
    enable = true;
    config = ''
      include {
          sub.dae
      }
      global {
          enable_local_tcp_fast_redirect: true

          # lan_interface: docker0
          wan_interface: auto         

          tcp_check_url: 'https://www.apple.com/library/test/success.html'
          udp_check_dns: 'dns.google.com:53,114.114.114.114:53,2001:4860:4860::8888,1.1.1.1:53'
          check_tolerance: 100ms 

          tls_implementation: utls
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
                  qname(geosite:cn) -> alidns
                  qname(suffix: com, keyword: google) -> googledns
                  fallback: alidns
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
              policy: min_avg10
              policy: random
          }
      }
      routing {
          pname(NetworkManager) -> direct
          dip(geoip:private,geoip:cn) -> direct
          domain(geosite:cn) -> direct
          l4proto(udp) && dport(443) -> block
          fallback: group
      }
    '';
  };

  environment.etc."dae/sub.dae".source = config.age.secrets.sub.path;
}
