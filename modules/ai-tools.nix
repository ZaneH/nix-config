{
  pkgs,
  lib,
  ...
}:
{
  home.packages = with pkgs; [
    claude-code
    opencode
    pi
    herdr
  ];

  home.sessionVariables = {
    # For [rpiv-voice](https://pi.dev/packages/@juicesharp/rpiv-voice)
    PI_LIBS = lib.makeLibraryPath [
      pkgs.alsa-lib
      pkgs.stdenv.cc.cc.lib
    ];
  };

  # programs.omp = {
  #   enable = true;
  #   settings.startup.quiet = true;
  # };
}
