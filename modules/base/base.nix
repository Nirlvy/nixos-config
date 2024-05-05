{pkgs, ...}: {
  users.users.nirlvy = {
    isNormalUser = true;
    description = "nirlvy";
    extraGroups = [
      "adbusers"
      "libvirtd"
      "networkmanager"
      "video"
      "wheel"
    ];
    shell = pkgs.zsh;
  };
}
