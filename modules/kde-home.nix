{ config, lib, pkgs, ... }:
  with lib; let
    cfg = config.features.desktop.plasma;
  in
  
{
    options.features.desktop.plasma.enable =
      mkEnableOption "configure KDE Plasma desktop environment";

    config = mkIf cfg.enable {
      programs.plasma = {
        enable = true;
        workspace = {
          colorScheme = "BreezeDark";
        };
        spectacle = {
          shortcuts = {
            captureActiveWindow = "Ctrl+@";
            captureCurrentMonitor = "Ctrl+#";
            captureRectangularRegion = "Ctrl+$";
          };
        };
        kwin = {
          effects = {
            shakeCursor = {
              enable = false;
            };
          };
          nightLight = {
            enable = true;
            mode = "times";
            time = {
              morning = "06:00";
              evening = "20:00";
            };
            temperature = {
              day = 6500;
              night = 4600;
            };
          };
        };
        input = {
          keyboard = {
            repeatDelay = 300;
            repeatRate = 30;
          };
        };
      };
    };
  }