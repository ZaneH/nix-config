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
    ./nvim.nix
    # ./zig.nix
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
    gdb
    cmake
    gnumake
    gcc
    cmake-language-server
    clang-tools
    ccls
    ninja
    vscode-extensions.vadimcn.vscode-lldb
    vscode-extensions.ms-vscode.cpptools
    vscode-langservers-extracted
    yaml-language-server
    nixd
    cutter
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
    CODELLDB = "${pkgs.vscode-extensions.vadimcn.vscode-lldb}/share/vscode/extensions/vadimcn.vscode-lldb/adapter/codelldb";
    OPENDEBUGAD7 = "${pkgs.vscode-extensions.ms-vscode.cpptools}/share/vscode/extensions/ms-vscode.cpptools/debugAdapters/bin/OpenDebugAD7";
  };
}
