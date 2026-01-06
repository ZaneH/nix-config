{ config, pkgs, ... }:
let
  tex = (
    pkgs.texliveFull.withPackages (
      ps: with ps; [
        dvisvgm
        dvipng
        wrapfig
        amsmath
        ulem
        hyperref
        capt-of
        collection-latexrecommended
        xcolor
        fontspec
        microtype
        etoolbox
        fancyhdr
      ]
    )
  );
in
{
  home.packages = with pkgs; [
    copilot-language-server
    typescript-language-server
    typescript
    prettierd
    ltex-ls-plus
    tex
  ];

  programs.emacs = {
    enable = true;
    package = pkgs.emacs-pgtk;
  };
  services.emacs = {
    enable = true;
    startWithUserSession = false;
    package = pkgs.emacs-pgtk;
    defaultEditor = false;
    socketActivation.enable = true;
  };
}
