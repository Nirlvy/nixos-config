{ lib, pkgs, ... }:
{
  imports = [
    ./waybar

    ./fuzzel.nix
    ./packages.nix
    ./theme.nix
  ];

  xdg.configFile."hypr" = {
    source = ./hypr;
    recursive = true;
  };

  systemd.user.services =
    let
      userSystemdService =
        { app }:
        {
          Unit = {
            PartOf = [ "graphical-session.target" ];
            After = [ "graphical-session.target" ];
            Requisite = [ "graphical-session.target" ];
          };

          Service = {
            ExecStart = lib.getExe pkgs.${app};
            Restart = "on-failure";
            RestartSec = 1;
            TimeoutStopSec = 10;
          };

          Install = {
            WantedBy = [ "niri.service" ];
          };
        };
    in
    {
      hyprpaper = userSystemdService { app = "hyprpaper"; };
      hypridle = userSystemdService { app = "hypridle"; };
    };
}
