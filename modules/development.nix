{ pkgs, lib, config, ... }:

{
  ##########################################################################
  # Packages added to the user profile
  ##########################################################################
  home.packages = with pkgs; [
    ffmpeg
    direnv
    ngrok
    postgresql
    bun
    jq
    uv
    pnpm
    vscode
    httpie
  ];

  ##########################################################################
  # Environment variables for every shell (bash, zsh, fish …)
  ##########################################################################
  home.sessionVariables = {
    EDITOR = "nvim";
  };
}
