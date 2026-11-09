{ ... }:

{
  programs.hex = {
    enable = true;
    autostart = true;

    model = "parakeet_unified_en";
    language = "en";
    installModel = true;

    # Linux shortcuts need an ordinary key, not a modifier-only binding.
    shortcut = "alt+space";

    # Activation merges these preferences; Hex still owns its runtime state,
    # downloaded models and history. Undeclared settings are left untouched.
    settings = {
      # Audio
      release_microphone_while_idle = true;
      sound_effects = true;
      sound_effect_volume = 0.25;
      sound_theme = "classic";
      microphone = null;
      avoid_bluetooth_microphone = true;
      recording_audio_behavior = "do_nothing";
      recording_duck_volume = 0.2;
      pause_browser_media = false;

      # Dictation
      double_tap_lock = true;
      double_tap_only = false;
      shortcut_mode = "hold";
      paste_last_hotkey = "alt+shift+v";
      raw_dictation_hotkey = null;
      second_dictation_hotkey = null;
      transcription_device = "auto";
      history_retention = "week";

      # General
      enable_on_launch = true;
      paste_with_shift = false;
      gnome_keyboard_shortcuts = false;
      ui_language = null;
      indicator_position = "hidden";

      # Dictionary
      vocabulary = [ "AirPlay" ];
      vocabulary_boost = "normal";

      # Keyboard model switching
      "keyboard_model_switching.enabled" = false;
      "keyboard_model_switching.mappings" = { };

      # Output processing
      "dictation_processing.default_mode" = {
        name = "Global";
        applications = [ ];
        browser_hosts = [ ];
        replacements = [ ];
        transformations = [ ];
        post_processing = {
          enabled = false;
          prompt = ''
            Rewrite the transcript into clear, natural
            text while preserving the speaker's
            intended meaning.
          '';
          model = null;
          variant = null;
          deadline_seconds = 30;
        };
      };
      "dictation_processing.modes" = [ ];

      # Meetings
      "meetings.enabled" = false;
      "meetings.output_folder" = null;
      # Apple Intelligence is macOS-only; keep Linux summaries disabled.
      "meetings.summaries" = "off";
      "meetings.show_recording_indicator" = true;
      "meetings.recording_indicator_corner" = "top_right";
      "meetings.providers" = [ ];

      # Capture / Annotate
      "capture.enabled" = true;
      "capture.hotkey" = "alt+shift+s";
      "capture.transcriber" = "parakeet";
      "capture.folder" = null;
      "capture.media_days" = 7;
      "capture.bundle_days" = 30;
      "capture.show_overlays_in_recordings" = false;
      "capture.capsule_flow" = "list";
      "capture.routing" = {
        autoSend = "rules";
        undoWindowSec = null;
        sites = { };
        apps = { };
        servers = { };
        aliases = { };
        refusedRules = [ ];
        delivery = "steer";
        smartRouting = false;
        jevRouting = false;
        jev = null;
        jevApiKey = null;
        agentHost = null;
        agentOpencode = null;
        sendCaptures = true;
      };

      # macOS-only settings and dev-only Labs switches are omitted: Hex
      # rejects the whole settings batch if even a disabled key is unsupported.
      # Labs
      "labs.live_text" = false;
      "labs.vocabulary_biasing" = true;
      "labs.unload_idle" = false;
      "labs.unload_idle_minutes" = 15;
      "labs.restore_shortcut_default" = false;
      "labs.spoken_formatting" = true;
      "labs.filler_words" = true;
      "labs.spoken_symbols" = true;
      "labs.picker_sort_filter" = false;
      "labs.tap_or_hold" = false;
      "labs.benchmark_details" = false;
      "labs.parakeet_ultra" = false;
      "labs.standalone_special_keys" = false;
      "labs.history_stats" = true;
      "labs.skip_pauses" = false;
      "labs.output_fixes" = false;
    };
  };
}
