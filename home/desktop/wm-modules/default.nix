{ lib, pkgs, ... }:
{
  imports = [
    ./waybar
    ./wofi

    ./packages.nix
    ./theme.nix
  ];

  xdg.configFile."hypr" = {
    source = ./hypr;
    recursive = true;
  };

  systemd.user.services = {
    hyprpaper = {
      Unit = {
        Wants = [ "graphical-session.target" ];
        PartOf = [ "graphical-session.target" ];
        After = [ "graphical-session.target" ];
        Requisite = [ "graphical-session.target" ];
      };

      Service = {
        ExecStart = lib.getExe pkgs.hyprpaper;
        Restart = "on-failure";
        RestartSec = 1;
        TimeoutStopSec = 10;
      };

      Install = {
        WantedBy = [ "niri.service" ];
      };

    };

    hypridle = {
      Unit = {
        Wants = [ "graphical-session.target" ];
        PartOf = [ "graphical-session.target" ];
        After = [ "graphical-session.target" ];
        Requisite = [ "graphical-session.target" ];
      };

      Service = {
        ExecStart = lib.getExe pkgs.hypridle;
        Restart = "on-failure";
        RestartSec = 1;
        TimeoutStopSec = 10;
      };

      Install = {
        WantedBy = [ "niri.service" ];
      };
    };
  };
}
