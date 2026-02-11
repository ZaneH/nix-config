{ pkgs, ... }:

{
  programs.neovim = {
    enable = true;
  };
  home.packages = with pkgs; [
    stylua
    tree-sitter
    glow
  ];
}
