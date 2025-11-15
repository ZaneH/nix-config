{ pkgs, ... }:

{
  imports = [ 
    # ./entertainment.nix
    # ./research.nix 
    # ./work.nix 
  ];
  fonts.fontconfig.enable = true;
  nix = {
    settings.auto-optimise-store = true;
    gc = {
      automatic = true;
      options = "--delete-older-than 30d";
    };
  };
  home = { 
    packages = with pkgs; [ 
      # Most of my packages declared are in modules/linux.nix
    ];
    stateVersion = "25.05";
  };
  #nix = {
    #package = pkgs.nixUnstable;
    #settings = {
      #experimental-features = "nix-command flakes";
      #allow-import-from-derivation = true;
    #};
  #};
  home.shell.enableZshIntegration = true;
  programs = {
    home-manager.enable = true;
    # direnv.enable = true;
    # fish = {
    #   enable = true;
    #   interactiveShellInit = import ../dotfiles/fish-config.nix { inherit pkgs; };
    #   plugins = [
    #     #{ name = "grc"; src = pkgs.fishPlugins.grc.src; }
    #     #{
    #     #  name = "z";
    #     #  src = pkgs.fetchFromGitHub {
    #     #    owner = "jethrokuan";
    #     #    repo = "z";
    #     #    rev = "e0e1b9dfdba362f8ab1ae8c1afc7ccf62b89f7eb";
    #     #    sha256 = "0dbnir6jbwjpjalz14snzd3cgdysgcs3raznsijd6savad3qhijc";
    #     #  };
    #     #}
    #   ];
    # };
    # zoxide = {
    #   enable = true;
    #   enableFishIntegration = true;
    #   options = ["--cmd cd | source"];
    # };
#    tmux = {
#      enable = true;
#      keyMode = "vi";
#      extraConfig = builtins.readFile ../dotfiles/.tmux.conf;
#    };
    # neovim = {
    #   enable = true;
    #   defaultEditor = true;
    #   viAlias = true;
    #   vimAlias = true;

    #   # Pass configuration options directly
    #   extraConfig = ''
    #     set autoindent
    #     set smartindent
    #     filetype plugin indent on
    #   '';

    #   # Optionally, include plugins using an overlay or package reference.
    #   # For example, using vim-nix if it’s available as a package:
    #   plugins = with pkgs.vimPlugins; [ vim-nix ];
    # };
    # git = {
    #   enable = true;
    #   package = pkgs.gitAndTools.gitFull;
    #   includes = [
    #     # { path = ../dotfiles/gitconfig; } # git account config for paths
    #     # { condition = "gitdir:iohk/"; path = ../dotfiles/gitconfig-iohk; } 
    #     # { condition = "gitdir:input-output-hk/"; path = ../dotfiles/gitconfig-iohk; }
    #     # { condition = "gitdir:IntersectMBO/"; path = ../dotfiles/gitconfig-iohk; }
    #     # { condition = "gitdir:cardano-foundation/"; path = ../dotfiles/gitconfig-iohk; }
    #     # { condition = "gitdir:circuithub/"; path = ../dotfiles/gitconfig-circuithub; }
    #   ];
    # };
    # zoxide = {
    #   enable = true
    # };
#    vim = {
#      enable = true;
#      plugins = with pkgs.vimPlugins; [
#        airline
#        fugitive
#        vim-markdown
#        nerdtree
#        nerdcommenter
#        molokai
#        repeat
#        surround
#        syntastic
#      ];
#      extraConfig = builtins.readFile ../dotfiles/.vimrc;
#    };
#    zsh = {
#      enable = true;
#      prezto = {
#        enable = true;
#        # https://github.com/nix-community/home-manager/issues/2255
#        caseSensitive = true;
#        prompt.theme = "powerlevel10k";
#        pmodules = [
#          "environment"
#          "terminal"
#          "editor"
#          "history"
#          "directory"
#          "spectrum"
#          "utility"
#          "git"
#          "completion"
#          "syntax-highlighting"
#          "history-substring-search"
#          "prompt"
#        ];
#        editor.keymap = "vi";
#      };
#      initExtra = builtins.readFile ../dotfiles/.zshrc + builtins.readFile ../dotfiles/.p10k.zsh;
#    };
  };
  services = {
  #  gpg-agent = {
  #    enable = true;
  #    enableSshSupport = true;
  #    # one day
  #    maxCacheTtl = 86400;
  #    # six hours
  #    defaultCacheTtl = 21600;
  #    pinentry.package  = pkgs.pinentry-qt;
  #  };
  };
}
