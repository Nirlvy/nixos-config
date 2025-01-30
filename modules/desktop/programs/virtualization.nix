{ pkgs, ... }:
{
  virtualisation = {
    libvirtd = {
      enable = true;
      qemu = {
        package = pkgs.qemu_kvm;
      };
    };

    # docker = {
    #   rootless = {
    #     enable = true;
    #     setSocketVariable = true;
    #   };
    # };

    podman = {
      enable = true;
      dockerCompat = true;
      defaultNetwork.settings.dns_enabled = true;
    };

    waydroid.enable = false;
  };

  programs.virt-manager.enable = true;

  users.users.nirlvy.extraGroups = [ "libvirtd" ];
}
