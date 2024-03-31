{ pkgs, ... }:

{

  virtualisation = {

    libvirtd = {
      enable = true;
      qemu = {
        package = pkgs.qemu_kvm;
      };
    };

    podman = {
      enable = true;

      dockerCompat = true;
      defaultNetwork.settings.dns_enabled = true;
    };

    # waydroid.enable = true;

  };

  programs.virt-manager.enable = true;

  environment.systemPackages = [
    pkgs.podman-desktop
  ];

}
