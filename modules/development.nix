{
  pkgs,
  lib,
  config,
  zig,
  ...
}:

{
  imports = [
    ./go.nix
    ./emacs.nix
  ];

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
    act
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
    hugo
    zigpkgs.master-2026-01-04
  ];

  programs.git = {
    enable = true;
    lfs.enable = true;
  };

  ##########################################################################
  # Environment variables for every shell (bash, zsh, fish …)
  ##########################################################################
  home.sessionVariables = {
    EDITOR = "nvim";
  };
}
