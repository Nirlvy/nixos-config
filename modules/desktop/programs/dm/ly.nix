{
  services.displayManager = {
    defaultSession = "niri-session";
    ly = {
      enable = true;
      settings = {
        # allow_empty_password = false;
        animation = "matrix";
        # bigclock = "en";
        # brightness_down_key = "null";
        # brightness_up_key = "null";
        clear_password = true;
        # clock = "%c";
        numlock = true;
        xinitrc = "null";
      };
    };
  };

  systemd.services.display-manager.environment.XDG_CURRENT_DESKTOP = "X-NIXOS-SYSTEMD-AWARE";
}
