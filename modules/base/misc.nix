{pkgs, ...}: {
  services.xserver.excludePackages = with pkgs; [
    xterm
  ];

  zramSwap.enable = true;

  documentation.nixos.enable = false;

  programs.zsh.enable = true;

  programs.adb.enable = true;
  users.users.nirlvy.extraGroups = ["adbusers"];
}
