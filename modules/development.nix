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
    nerd-fonts.jetbrains-mono
    gnupg
    lazygit
    nodejs_22
    docker
    hugo
    claude-code
    claude-monitor
    imagemagick
    basedpyright
    dbeaver-bin
    parquet-tools
    (opencode.overrideAttrs (oldAttrs: rec {
      version = "1.1.21";
      src = fetchFromGitHub {
        owner = "anomalyco";
        repo = "opencode";
        tag = "v${version}";
        hash = "sha256-8ykONBWMiq9EACHOsdx1AFPoj53Tsxi3EbUDVciH5Ok=";
      };
      node_modules = oldAttrs.node_modules.overrideAttrs {
        inherit version src;
        outputHash = "sha256-omSbcp/yKClsGbLiNJjeSL29CGKPbcem6f+nV13RjG4=";
      };
    }))
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
