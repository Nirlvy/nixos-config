{pkgs, ...}: {
  programs = {
    thunar = {
      enable = true;
      plugins = with pkgs.xfce; [
        thunar-volman
        thunar-archive-plugin
        thunar-media-tags-plugin
      ];
    };

    # for thunar saving changes
    xfconf.enable = true;
  };

  # for thunar
  environment.systemPackages = with pkgs; [
    xfce.exo
    xarchiver
  ];
}
