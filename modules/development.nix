{ pkgs, lib, config, ... }:

{
  ##########################################################################
  # Packages added to the user profile
  ##########################################################################
  home.packages = with pkgs; [
    neovim
    ffmpeg
    direnv
    ngrok
    postgresql
    bun
    jq
    uv
    pnpm
    tmux
    vscode
    httpie
    pciutils
  ];

  ##########################################################################
  # Environment variables for every shell (bash, zsh, fish …)
  ##########################################################################
  home.sessionVariables = {
    EDITOR = "nvim";
  };
}
