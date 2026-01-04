{
  pkgs,
  lib,
  config,
  ...
}:
let
  tex = (pkgs.texliveFull.withPackages (
    ps: with ps; [
      dvisvgm dvipng
      wrapfig amsmath ulem hyperref capt-of
      collection-latexrecommended xcolor
      fontspec microtype etoolbox fancyhdr
  ]));
in
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
    go
    gopls
    delve
    protobuf
    buf
    protoc-gen-go-grpc
    protoc-gen-go
    grpc-gateway
    tex
    hugo
  ];

  programs.emacs = {
    enable = true;
    package = pkgs.emacs-pgtk;
  };
  programs.git = {
    enable = true;
    lfs.enable = true;
  };
  services.emacs = {
    enable = true;
    startWithUserSession = false;
    package = pkgs.emacs-pgtk;
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
