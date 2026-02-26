{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    borgmatic
  ];

  systemd.services.borgmatic-repos = {
    description = "Run borgmatic repos backup";
    serviceConfig = {
      Type = "oneshot";
      User = "me";
      Group = "users";
      ExecStart = "${pkgs.borgmatic}/bin/borgmatic --config /home/me/.config/borgmatic/config.yaml";
    };
  };

  systemd.timers.borgmatic-repos = {
    description = "Run borgmatic for repos every other day";
    wantedBy = [ "timers.target" ];
    timerConfig = {
      OnCalendar = "*-*-1/2 03:00:00";
      Persistent = true;
      RandomizedDelaySec = "30m";
      AccuracySec = "1h";
      Unit = "borgmatic-repos.service";
    };
  };

  systemd.services.borgmatic-nas = {
    description = "Run borgmatic NAS backup";
    serviceConfig = {
      Type = "oneshot";
      User = "me";
      Group = "users";
      ExecStart = "${pkgs.borgmatic}/bin/borgmatic --config /home/me/.config/borgmatic/config-truenas.yaml";
    };
  };

  systemd.timers.borgmatic-nas = {
    description = "Run borgmatic NAS twice a week";
    wantedBy = [ "timers.target" ];
    timerConfig = {
      OnCalendar = "Mon,Thu 03:00:00";
      Persistent = true;
      RandomizedDelaySec = "30m";
      AccuracySec = "1h";
      Unit = "borgmatic-nas.service";
    };
  };
}
