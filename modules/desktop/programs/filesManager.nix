{ config, pkgs, ... }:
{
  programs = {
    thunar = {
      enable = true;
      plugins = with pkgs; [
        thunar-volman
        thunar-archive-plugin
        thunar-media-tags-plugin
      ];
    };

    # for thunar saving changes
    xfconf.enable = config.programs.thunar.enable;

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
      file-roller
      yazi
    ]
    ++ lib.optionals (config.programs.thunar.enable) [ xfce4-exo ];

  services = {
    gvfs = {
      enable = true;
      package = pkgs.gvfs;
    };
    tumbler.enable = true;
  };
}
