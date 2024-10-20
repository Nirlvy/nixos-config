{ lib, pkgs, ... }:
{
  imports = [
    ../.
  ];

  programs.niri.config = builtins.readFile ./config.kdl;

  systemd.user.services.xwayland-satellite = {
    Unit = {
      PartOf = [ "graphical-session.target" ];
      After = [ "graphical-session.target" ];
      Requisite = [ "graphical-session.target" ];
    };

    Service = {
      ExecStart = lib.getExe pkgs.xwayland-satellite;
      Restart = "on-failure";
      RestartSec = 1;
      TimeoutStopSec = 10;
    };

    Install = {
      WantedBy = [ "niri.service" ];
    };
  };
}
