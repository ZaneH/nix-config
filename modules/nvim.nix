{ pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    withRuby = false;
    withPython3 = false;
    sideloadInitLua = true;
  };
  home.packages = with pkgs; [
    stylua
    tree-sitter
    glow
  ];
}
