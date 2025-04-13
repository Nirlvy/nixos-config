{ config, pkgs, ... }:
{
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
    xfconf.enable = config.programs.thunar.enable;

    file-roller.enable = true;

    nautilus-open-any-terminal = {
      enable = false;
      terminal = "ghostty";
    };
  };

  environment.systemPackages =
    with pkgs;
    [
      # nautilus
      # selectdefaultapplication
      yazi
    ]
    ++ lib.optionals (config.programs.thunar.enable) [ xfce.exo ];

  services = {
    gvfs = {
      enable = true;
      package = pkgs.gvfs;
    };
    tumbler.enable = true;
  };
}
