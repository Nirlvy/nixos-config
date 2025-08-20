{ pkgs, ... }:
{
  systemd.user.services.wayland-pipewire-idle-inhibit = {
    Unit = {
      Description = "Inhibit Wayland idling when media is played through pipewire";
      Documentation = "https://github.com/rafaelrc7/wayland-pipewire-idle-inhibit";
    };
    Service = {
      ExecStart = "${pkgs.wayland-pipewire-idle-inhibit}/bin/wayland-pipewire-idle-inhibit -q";
      Restart = "always";
      RestartSec = 10;
    };
    Install = {
      WantedBy = [ "graphical-session.services" ];
    };
  };
}
