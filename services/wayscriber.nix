{ pkgs, ... }:

{
  systemd.user.services.wayscriber = {
    Unit = {
      Description = "Wayscriber Daemon";
      After = [ "graphical-session.target" ];
      Wants = [ "graphical-session.target" ];
    };

    Service = {
      ExecStart = "${pkgs.wayscriber}/bin/wayscriber --daemon";
      Restart = "on-failure";

      Environment = [
        "XDG_SESSION_TYPE=wayland"
      ];
    };

    Install = {
      WantedBy = [ "default.target" ];
    };
  };
}
