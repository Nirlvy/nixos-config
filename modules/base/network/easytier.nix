{
  services.easytier = {
    enable = true;
    instances.NH = {
      settings = {
        dhcp = true;
        network_name = "NHos";
        network_secret = "147258";
        peers = [
          "tcp://sh.vomiku.com:7910"
          "tcp://dreamlife.indevs.in:11010"
          "tcp://et-hk.clickor.click:11010"
        ];
        listeners = [
          "tcp://0.0.0.0:11010"
          "udp://0.0.0.0:11010"
          "wg://0.0.0.0:11011"
        ];
      };
      extraSettings = {
        ipv6_public_addr_auto = true;
        flags = {
          bind_device = true;
          enable_kcp_proxy = true;
          latency_first = true;
          private_mode = true;
          use_smoltcp = true;
        };
      };
    };

  };
}
