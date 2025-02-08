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
      }
      dns {
          upstream {
              alidns: 'udp://dns.alidns.com:53'
              googledns: 'tcp+udp://dns.google.com:53'
          }
          routing {
              request {
                  qname(geosite:category-ads-all) -> reject
                  qname(geosite:google@cn, geosite:cn) -> alidns
                  qname(keyword: garnix, keyword: bing, keyword: deepseek) -> googledns

                  qtype(https) -> reject
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
          proxy {
              policy: min_moving_avg
          }
      }
      routing {
          pname(NetworkManager) -> must_direct
          dip(geoip:private, geoip:cn) -> direct
          domain(geosite:cn, keyword: eoffcn) -> direct
          domain(keyword: garnix, keyword: bing, keyword: deepseek) -> proxy
          fallback: proxy
      }
    '';
  };

  environment.etc."dae/sub.dae".source = config.age.secrets.sub.path;
}
