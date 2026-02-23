{ ... }:

{
  programs.ghostty = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      theme = "Gruvbox Dark";
      font-size = 10;
      font-family = "Hack";
      gtk-wide-tabs = false;
      bell-features = "system";
      scrollback-limit = 10000000;
      gtk-custom-css = "/tmp/tab-style.css";
    };
  };
}
