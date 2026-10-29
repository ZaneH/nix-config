{ pkgs, ... }:

{
  programs.plasma = {
    enable = true;
    workspace = {
      colorScheme = "BreezeDark";
    };
    window-rules = [
      {
        description = "Window settings for brave";
        match = {
          window-class = {
            value = "brave";
            type = "substring";
            match-whole = false;
          };
          window-types = [ "normal" ];
          title = {
            value = "Picture in picture";
            type = "exact";
          };
        };
        apply = {
          above = {
            value = true;
            apply = "initially";
          };
        };
      }
    ];
    spectacle = {
      shortcuts = {
        captureActiveWindow = "Ctrl+@";
        captureCurrentMonitor = "Ctrl+#";
        captureRectangularRegion = "Ctrl+$";
      };
    };
    kwin = {
      effects = {
        shakeCursor.enable = false;
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
    # TODO: Media playback shortcuts, disable mouse acceleration
    # power management
    shortcuts = {
      "com.mitchellh.ghostty.desktop"."_launch" = "Ctrl+Alt+T";
    };
  };
}
