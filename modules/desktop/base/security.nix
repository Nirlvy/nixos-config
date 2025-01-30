{ pkgs, ... }:
{
  environment.systemPackages = [ pkgs.libsecret ];
  programs.seahorse.enable = true;
  security = {
    pam.services = {
      login.enableGnomeKeyring = true;
      hyprlock = { };
    };
    polkit.enable = true;
    sudo.wheelNeedsPassword = false;
  };
  services.gnome.gnome-keyring.enable = true;

  systemd.user.services.polkit-gnome-authentication-agent-1 = {
    description = "polkit-gnome-authentication-agent-1";
    wantedBy = [ "graphical-session.target" ];
    wants = [ "graphical-session.target" ];
    after = [ "graphical-session.target" ];
    serviceConfig = {
      Type = "simple";
      ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
      Restart = "on-failure";
      RestartSec = 1;
      TimeoutStopSec = 10;
    };
  };

  security.sudo-rs = {
    enable = true;
    execWheelOnly = true;
    wheelNeedsPassword = false;
  };
}
