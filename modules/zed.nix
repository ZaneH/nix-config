{ pkgs, ... }:

{
  programs.zed-editor = {
    enable = true;
    userSettings = {
      theme = {
        mode = "system";
        light = "Gruvbox Light";
        dark = "Gruvbox Dark";
      };
      telemetry = {
        metrics = false;
      };
      vim_mode = true;
      ui_font_size = 11;
      buffer_font_size = 11;
      collaboration_panel = {
        button = false;
      };
      title_bar = {
        show_sign_in = false;
        show_onboarding_banner = false;
        show_user_picture = false;
      };
      toolbar = {
        agent_review = false;
      };
    };
    extensions = [
      "org"
      "nix"
      "git-firefly"
    ];
    userKeymaps = [
      {
        context = "VimControl && vim_mode == normal";
        bindings = {
          "space space" = "file_finder::Toggle";
          "space g b" = "git::Branch";
          "space t" = "terminal_panel::ToggleFocus";
          "space g g" = "git_panel::ToggleFocus";
          "space /" = "pane::DeploySearch";
          "space f s" = "workspace::Save";
          "space h" = "editor::ToggleInlayHints";
          "ctrl-a" = "editor::ToggleCodeActions";
          "] f" = "vim::NextMethodStart";
          "[ f" = "vim::PreviousMethodStart";
        };
      }
    ];
  };
}
