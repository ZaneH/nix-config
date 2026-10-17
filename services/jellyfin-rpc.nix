{ pkgs, lib, ... }:

{
  home.packages = [ pkgs.jellyfin-rpc ];

  systemd.user.services.jellyfin-rpc = {
    Unit = {
      Description = "Jellyfin RPC Daemon";
      After = [ "graphical-session.target" ];
      PartOf = [ "graphical-session.target" ];
      StartLimitIntervalSec = 0;
    };

    Service = {
      ExecStart = lib.getExe pkgs.jellyfin-rpc;
      Restart = "on-failure";
      RestartSec = 10;
    };

    Install = {
      WantedBy = [ "graphical-session.target" ];
    };
  };
}
