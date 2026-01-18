{
  pkgs,
  lib,
  config,
  ...
}:
{
  virtualisation = {
    libvirtd = {
      enable = false;
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
      enable = false;
      dockerCompat = true;
      defaultNetwork.settings.dns_enabled = true;
    };

    waydroid.enable = false;
  };

  # environment.systemPackages = with pkgs; [
  # boxbuddy
  # distrobox
  # pods
  # ];

  programs.virt-manager.enable = false;

  users.users.nirlvy.extraGroups =
    [ ] ++ lib.optionals (config.virtualisation.libvirtd.enable) [ "libvirtd" ];
}
