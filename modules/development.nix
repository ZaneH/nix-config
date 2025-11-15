{ pkgs, lib, config, ... }:

{
  ##########################################################################
  # Packages added to the user profile
  ##########################################################################
  home.packages = with pkgs; [
    uv
    bun
    git-lfs
    fd
    htop
    ripgrep
    tealdeer
    ffmpeg
    direnv
    htop
    btop
    jq
    git
    wget
    postgresql
    fd
    uv
    ngrok
    httpie
    pnpm
    tmux
  ];

  ##########################################################################
  # Environment variables for every shell (bash, zsh, fish …)
  ##########################################################################
  home.sessionVariables = {
    EDITOR = "nvim";
  };
}
