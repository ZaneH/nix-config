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
    go
    gopls
  ];

  programs.emacs.enable = true;
  services.emacs = {
    enable = true;
    package = pkgs.emacs-gtk;
    startWithUserSession = true;
    defaultEditor = false;
  };

  ##########################################################################
  # Environment variables for every shell (bash, zsh, fish …)
  ##########################################################################
  home.sessionVariables = {
    EDITOR = "nvim";
  };
}
