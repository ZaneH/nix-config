{
  pkgs,
  lib,
  config,
  ...
}:

{
  imports = [
    ./go.nix
    ./emacs.nix
    ./zig.nix
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
    # nerd-fonts.jetbrains-mono
    gnupg
    lazygit
    nodejs_22
    docker
    hugo
  ];

  programs.git = {
    enable = true;
    settings.init.defaultBranch = "main";
    lfs.enable = true;
  };

  ##########################################################################
  # Environment variables for every shell (bash, zsh, fish …)
  ##########################################################################
  home.sessionVariables = {
    EDITOR = "nvim";
  };
}
