{ lib, pkgs, ... }:
{
  imports = [
    ./fuzzel
    ./waybar
    ./wofi

    ./packages.nix
    ./theme.nix
  ];

  xdg.configFile."hypr" = {
    source = ./hypr;
    recursive = true;
  };

  systemd.user.services =
    let
      app =
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
      hyprpaper = app { app = "hyprpaper"; };
      hypridle = app { app = "hypridle"; };
      mako = app { app = "mako"; };
    };
}
