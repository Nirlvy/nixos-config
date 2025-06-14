{ lib, pkgs, ... }:
{
  programs.waybar = {
    enable = true;
    style = ./style.css;
  };

  systemd.user.services.waybar = {
    Unit = {
      PartOf = [ "graphical-session.target" ];
      After = [ "graphical-session.target" ];
      Requisite = [ "graphical-session.target" ];
    };

    Service = {
      ExecStart = lib.getExe pkgs.waybar;
      ExecReload = "${pkgs.coreutils}/bin/kill -SIGUSR2 waybar";
      Restart = "on-failure";
      RestartSec = 1;
      TimeoutStopSec = 10;
    };

    Install = {
      WantedBy = [ "niri.service" ];
    };
  };

  xdg.configFile = {
    "waybar/config".source = ./config.json;
  };
}
