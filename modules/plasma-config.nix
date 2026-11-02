{ pkgs, ... }:

{
  programs.plasma = {
    enable = true;
    workspace = {
      colorScheme = "BreezeDark";
      wallpaper = "/home/me/.local/share/wallpapers/Nothing1/contents/images/5521x2487.png";
    };
    # Brave PiP above other windows
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
    panels = [
      {
        screen = "all";
        location = "bottom";
        widgets = [
          { kickoff.icon = "kimtoy"; }
          {
            iconTasks.launchers = [
              "applications:brave-browser.desktop"
              "applications:org.kde.dolphin.desktop"
              "applications:com.mitchellh.ghostty.desktop"
              "applications:com.obsproject.Studio.desktop"
              "applications:davinci-resolve-studio.desktop"
            ];
          }
          "org.kde.plasma.pager"
          {
            systemTray.items = {
              extra = [
                "org.kde.plasma.volume"
                "org.kde.plasma.bluetooth"
                "org.kde.plasma.brightness"
                "org.kde.plasma.cameraindicator"
                "org.kde.plasma.devicenotifier"
                "org.kde.kscreen"
                "org.kde.plasma.keyboardlayout"
                "org.kde.plasma.keyboardindicator"
                "org.kde.plasma.networkmanagement"
                "org.kde.plasma.battery"
                "org.kde.plasma.printmanager"
                "org.kde.plasma.clipboard"
                "org.kde.plasma.manage-inputmethod"
                "org.kde.plasma.notifications"
                "org.kde.plasma.weather"
              ];
              hidden = [
                "org.kde.plasma.bluetooth"
                "org.kde.plasma.brightness"
                "org.kde.plasma.networkmanagement"
                "org.kde.plasma.battery"
                "org.kde.plasma.clipboard"
                "TelegramDesktop"
                "wayscriber"
              ];
            };
          }
          {
            digitalClock = {
              time.format = "12h";
              date.enable = true;
              date.format = "shortDate";
            };
          }
          "org.kde.plasma.showdesktop"
        ];
      }
    ];
    shortcuts = {
      Strawberry.next_track = [ ];
      Strawberry.play_pause = [ ];
      Strawberry.prev_track = [ ];
      Strawberry.stop = [ ];
      "com.dec05eba.gpu_screen_recorder".gpu_screen_recorder_pause_unpause_recording = "Alt+2";
      "com.dec05eba.gpu_screen_recorder".gpu_screen_recorder_save_replay = "Alt+3";
      "com.dec05eba.gpu_screen_recorder".gpu_screen_recorder_start_stop_recording = "Alt+1";
      kaccess."Toggle Screen Reader On and Off" = "Meta+Alt+S";
      kmix.decrease_microphone_volume = "Microphone Volume Down";
      kmix.decrease_volume = "Volume Down";
      kmix.decrease_volume_small = "Shift+Volume Down";
      kmix.increase_microphone_volume = "Microphone Volume Up";
      kmix.increase_volume = "Volume Up";
      kmix.increase_volume_small = "Shift+Volume Up";
      kmix.mic_mute = [
        "Microphone Mute"
        "Meta+Volume Mute"
      ];
      kmix.mute = "Volume Mute";
      kmix.push_to_talk = [ ];
      ksmserver."Lock Session" = [
        "Screensaver"
        "Meta+L"
      ];
      ksmserver."Log Out" = "Ctrl+Alt+Del";
      kwin."Activate Window Demanding Attention" = "Meta+Ctrl+A";
      kwin."Edit Tiles" = "Meta+T";
      kwin.Expose = "Ctrl+F9";
      kwin.ExposeAll = [
        "Launch (C)"
        "Ctrl+F10"
      ];
      kwin.ExposeClass = "Ctrl+F7";
      kwin."Grid View" = "Meta+G";
      kwin."Kill Window" = "Meta+Ctrl+Esc";
      kwin.MoveMouseToCenter = "Meta+F6";
      kwin.MoveMouseToFocus = "Meta+F5";
      kwin.MoveZoomDown = [ ];
      kwin.MoveZoomLeft = [ ];
      kwin.MoveZoomRight = [ ];
      kwin.MoveZoomUp = [ ];
      kwin.Overview = "Meta+W";
      kwin."Setup Window Shortcut" = [ ];
      kwin."Show Desktop" = "Meta+D";
      kwin."Switch One Desktop Down" = "Meta+Ctrl+Down";
      kwin."Switch One Desktop Up" = "Meta+Ctrl+Up";
      kwin."Switch One Desktop to the Left" = "Meta+Ctrl+Left";
      kwin."Switch One Desktop to the Right" = "Meta+Ctrl+Right";
      kwin."Switch Window Down" = "Meta+Alt+Down";
      kwin."Switch Window Left" = "Meta+Alt+Left";
      kwin."Switch Window Right" = "Meta+Alt+Right";
      kwin."Switch Window Up" = "Meta+Alt+Up";
      kwin."Switch to Desktop 1" = "Ctrl+F1";
      kwin."Switch to Desktop 2" = "Ctrl+F2";
      kwin."Switch to Desktop 3" = "Ctrl+F3";
      kwin."Switch to Desktop 4" = "Ctrl+F4";
      kwin."Switch to Desktop 5" = "Ctrl+F5";
      kwin."Switch to Desktop 6" = [ ];
      kwin."Switch to Desktop 7" = [ ];
      kwin."Switch to Desktop 8" = [ ];
      kwin."Switch to Desktop 9" = [ ];
      kwin."Switch to Next Desktop" = [ ];
      kwin."Switch to Next Screen" = [ ];
      kwin."Switch to Previous Desktop" = [ ];
      kwin."Switch to Previous Screen" = [ ];
      kwin."Switch to Screen 0" = [ ];
      kwin."Switch to Screen 1" = [ ];
      kwin."Switch to Screen 2" = [ ];
      kwin."Switch to Screen 3" = [ ];
      kwin."Switch to Screen 4" = [ ];
      kwin."Switch to Screen 5" = [ ];
      kwin."Walk Through Windows" = [
        "Alt+Tab"
        "Meta+Tab"
      ];
      kwin."Walk Through Windows (Reverse)" = [
        "Alt+Shift+Tab"
        "Meta+Shift+Tab"
      ];
      kwin."Walk Through Windows of Current Application" = [
        "Alt+`"
        "Meta+`"
      ];
      kwin."Walk Through Windows of Current Application (Reverse)" = [
        "Alt+~"
        "Meta+~"
      ];
      kwin."Window Close" = "Alt+F4";
      kwin."Window Maximize" = "Meta+PgUp";
      kwin."Window Minimize" = "Meta+PgDown";
      kwin."Window One Desktop Down" = "Meta+Ctrl+Shift+Down";
      kwin."Window One Desktop Up" = "Meta+Ctrl+Shift+Up";
      kwin."Window One Desktop to the Left" = "Meta+Ctrl+Shift+Left";
      kwin."Window One Desktop to the Right" = "Meta+Ctrl+Shift+Right";
      kwin."Window Operations Menu" = "Alt+F3";
      kwin."Window Quick Tile Bottom" = "Meta+Down";
      kwin."Window Quick Tile Left" = "Meta+Left";
      kwin."Window Quick Tile Right" = "Meta+Right";
      kwin."Window Quick Tile Top" = "Meta+Up";
      kwin."Window Restore" = "Meta+Backspace";
      kwin."Window Shrink Horizontal" = [ ];
      kwin."Window Shrink Vertical" = [ ];
      kwin."Window to Desktop 1" = [ ];
      kwin."Window to Desktop 2" = [ ];
      kwin."Window to Desktop 3" = [ ];
      kwin."Window to Desktop 4" = [ ];
      kwin."Window to Desktop 5" = [ ];
      kwin."Window to Next Desktop" = [ ];
      kwin."Window to Next Screen" = "Meta+Shift+Right";
      kwin."Window to Previous Screen" = "Meta+Shift+Left";
      kwin.disableInputCapture = "Meta+Shift+Esc";
      kwin.view_actual_size = "Meta+0";
      kwin.view_zoom_in = [
        "Meta++"
        "Meta+="
      ];
      kwin.view_zoom_out = "Meta+-";
      mediacontrol.mediavolumedown = "F10";
      mediacontrol.mediavolumeup = "F11";
      mediacontrol.nextmedia = [
        "F7"
        "Media Next"
      ];
      mediacontrol.pausemedia = "Media Pause";
      mediacontrol.playmedia = [ ];
      mediacontrol.playpausemedia = [
        "F9"
        "Media Play"
      ];
      mediacontrol.previousmedia = [
        "F6"
        "Media Previous"
      ];
      mediacontrol.seekbackwardmedia = "Media Rewind";
      mediacontrol.seekbackwardmedialong = [ ];
      mediacontrol.seekforwardmedia = "Media Fast Forward";
      mediacontrol.seekforwardmedialong = [ ];
      mediacontrol.stopmedia = "Media Stop";
      "org.kde.konsole"._launch = [ ];
      org_kde_powerdevil.Hibernate = "Hibernate";
      org_kde_powerdevil."Toggle Keyboard Backlight" = "Keyboard Light On/Off";
      org_kde_powerdevil."Turn Off Screen" = [ ];
      org_kde_powerdevil.powerProfile = [
        "Battery"
        "Meta+B"
      ];
      plasmashell."Slideshow Wallpaper Next Image" = [ ];
      plasmashell."activate application launcher" = [
        "Meta"
      ];
      plasmashell."activate task manager entry 1" = "Meta+1";
      plasmashell."activate task manager entry 2" = "Meta+2";
      plasmashell."activate task manager entry 3" = "Meta+3";
      plasmashell."activate task manager entry 4" = "Meta+4";
      plasmashell."activate task manager entry 5" = "Meta+5";
      plasmashell."activate task manager entry 6" = "Meta+6";
      plasmashell."activate task manager entry 7" = "Meta+7";
      plasmashell."activate task manager entry 8" = "Meta+8";
      plasmashell."activate task manager entry 9" = "Meta+9";
      plasmashell."activate task manager entry 10" = [ ];
      "services/org.kde.spectacle.desktop".ActiveWindowScreenShot = "Ctrl+@";
      "services/org.kde.spectacle.desktop".CurrentMonitorScreenShot = "Ctrl+#";
      "services/org.kde.spectacle.desktop".OpenWithoutScreenshot = [ ];
      "services/org.kde.spectacle.desktop".RectangularRegionScreenShot = "Ctrl+$";
      "services/plasma-manager-commands.desktop".open-ghostty = "Ctrl+Alt+T";
    };
    configFile = {
      kcminputrc.Keyboard.NumLock = 0;
      kcminputrc.Keyboard.RepeatDelay = 300;
      kcminputrc.Keyboard.RepeatRate = 30;
      kcminputrc."Libinput/1133/49291/Logitech G502 HERO Gaming Mouse".PointerAcceleration = "-0.650";
      kcminputrc."Libinput/1133/49291/Logitech G502 HERO Gaming Mouse".PointerAccelerationProfile = 1;
      kcminputrc.Mouse.cursorTheme = "WhiteSur-cursors";
      kdeglobals.Icons.Theme = "Colloid-Dark";
      kdeglobals.PreviewSettings.EnableRemoteFolderThumbnail = false;
      kiorc.Confirmations.ConfirmDelete = true;
      kiorc.Confirmations.ConfirmEmptyTrash = true;
      kiorc.Confirmations.ConfirmTrash = false;
      kiorc."Executable scripts".behaviourOnLaunch = "alwaysAsk";
      klipperrc.Actions.EnableMagicMimeActions = false;
      klipperrc.General.IgnoreImages = false;
      klipperrc.General.MaxClipItems = 100;
      kscreenlockerrc.Daemon.Timeout = 30;
      # Download: https://store.kde.org/p/2116657
      kscreenlockerrc."Greeter/Wallpaper/org.kde.image/General".Image =
        "file:///home/me/.local/share/wallpapers/Nothing1/";
      kscreenlockerrc."Greeter/Wallpaper/org.kde.image/General".PreviewImage =
        "file:///home/me/.local/share/wallpapers/Nothing1/";
      kscreenlockerrc."Greeter/Wallpaper/org.kde.image/General".SlidePaths =
        "/home/me/.local/share/wallpapers/,/nix/store/nalqpvc3sn67b3xc6lsl2z1xygv9fn56-breeze-6.7.5/share/wallpapers/,/run/current-system/sw/share/wallpapers/";
      ksmserverrc.General.loginMode = "emptySession";
      ksplashrc.KSplash.Theme = "org.kde.breeze.desktop";
      ktrashrc."\\/home\\/me\\/.local\\/share\\/Trash".Days = 7;
      ktrashrc."\\/home\\/me\\/.local\\/share\\/Trash".LimitReachedAction = 0;
      ktrashrc."\\/home\\/me\\/.local\\/share\\/Trash".Percent = 10;
      ktrashrc."\\/home\\/me\\/.local\\/share\\/Trash".UseSizeLimit = true;
      ktrashrc."\\/home\\/me\\/.local\\/share\\/Trash".UseTimeLimit = false;
      kwinrc.Desktops.Id_1 = "Desktop_1";
      kwinrc.Desktops.Id_2 = "Desktop_2";
      kwinrc.Desktops.Id_3 = "Desktop_3";
      kwinrc.Desktops.Id_4 = "Desktop_4";
      kwinrc.Desktops.Id_5 = "Desktop_5";
      kwinrc.Desktops.Name_1 = "General";
      kwinrc.Desktops.Name_2 = "Code (Zen)";
      kwinrc.Desktops.Name_3 = "Social";
      kwinrc.Desktops.Name_4 = "Music";
      kwinrc.Desktops.Name_5 = "Misc";
      kwinrc.Desktops.Number = 5;
      kwinrc.Desktops.Rows = 1;
      kwinrc.NightColor.Active = true;
      kwinrc.NightColor.DayTemperature = 6500;
      kwinrc.NightColor.NightTemperature = 4600;
      kwinrc.Plugins.padding = 4;
      kwinrc.Plugins.shakecursorEnabled = false;
      kwinrc.Plugins.slideEnabled = false;
      kwinrc.Xwayland.Scale = 1;
      kwinrc."org.kde.kdecoration2".BorderSize = "None";
      kwinrc."org.kde.kdecoration2".BorderSizeAuto = false;
      kwinrc."org.kde.kdecoration2".ButtonsOnLeft = "M";
      plasma-localerc.Formats.LANG = "en_US.UTF-8";
      plasmanotifyrc.Notifications.PopupTimeout = 3000;
      plasmanotifyrc.Notifications.ShowPopupTimeout = false;
      plasmanotifyrc."Services/drkonqi-coredump-launcher".ShowInHistory = false;
      plasmarc.Theme.name = "default";
      plasmarc.Wallpapers.usersWallpapers = "";
      spectaclerc.Annotations.annotationToolType = 6;
      spectaclerc.Annotations.freehandStrokeColor = "255,255,0";
      spectaclerc.Annotations.rectangleFillColor = "255,255,255,0";
      spectaclerc.Annotations.rectangleShadow = false;
      spectaclerc.Annotations.rectangleStrokeColor = "255,0,0";
      spectaclerc.ImageSave.translatedScreenshotsFolder = "Screenshots";
      spectaclerc.VideoSave.translatedScreencastsFolder = "Screencasts";
    };
  };
}
