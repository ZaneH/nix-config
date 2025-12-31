{
  pkgs,
  lib,
  config,
  ...
}:

{
  ##########################################################################
  # Packages added to the user profile
  ##########################################################################
  home.packages = with pkgs; [
    nix-prefetch-scripts
    direnv
    ngrok
    postgresql
    bun
    jq
    uv
    pnpm
    vscode
    httpie
    cmake
    gnumake
    gcc
    libtool
    nerd-fonts.jetbrains-mono
    gnupg
    lazygit
    nodejs_22
    docker
    go
    gopls
  ];

  programs.emacs.enable = true;
  services.emacs = {
    enable = true;
    startWithUserSession = false;
    package = pkgs.emacs-gtk;
    defaultEditor = false;
    socketActivation.enable = true;
  };

  ##########################################################################
  # Environment variables for every shell (bash, zsh, fish …)
  ##########################################################################
  home.sessionVariables = {
    EDITOR = "nvim";
  };
}
