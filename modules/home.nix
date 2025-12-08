{ pkgs, ... }:

{
  imports = [
    # ./entertainment.nix
    # ./research.nix
    # ./work.nix
  ];
  fonts.fontconfig.enable = true;
  nix = {
    settings.auto-optimise-store = true;
    gc = {
      automatic = true;
      options = "--delete-older-than 30d";
    };
  };
  home = {
    packages = with pkgs; [
      # Most of my packages declared are in modules/linux.nix
    ];
    file = {
      ".ssh/.keep" = {
        text = "";
        onChange = ''
          chmod 700 ~/.ssh
        '';
      };
      ".alias.zsh".source = ../dotfiles/alias.zsh;
      ".local.zsh".source = ../dotfiles/local.zsh;
    };
    stateVersion = "25.05";
  };
  home.shell.enableZshIntegration = true;
  programs = {
    home-manager.enable = true;
    direnv.enable = true;
    tmux = {
      enable = true;
      extraConfig = builtins.readFile ../dotfiles/tmux.conf;
    };
    neovim = {
      enable = true;
    };
    zoxide = {
      enable = true;
    };
    vim = {
      enable = true;
      extraConfig = builtins.readFile ../dotfiles/vimrc;
    };
    zsh = {
      enable = true;
      autosuggestion.enable = true;
      oh-my-zsh = {
        enable = true;
        theme = "agnoster";
        plugins = [ "git" "gpg-agent" ];
      };
      initContent = builtins.readFile ../dotfiles/zshrc;
    };
  };
  services = {
    gpg-agent = {
      enable = true;
      enableSshSupport = true;
      # one day
      maxCacheTtl = 86400;
      # six hours
      defaultCacheTtl = 21600;
      pinentry.package = pkgs.pinentry-qt;
    };
  };
}
