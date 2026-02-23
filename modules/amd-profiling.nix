{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.programs.amdProfiling;
in
{
  options.programs.amdProfiling = {
    enable = lib.mkEnableOption "AMD-oriented profiling toolchain";
    enableUprof = lib.mkEnableOption "AMD uProf (requires manually downloaded tarball)";
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages =
      with pkgs;
      [
        perf
        hotspot
        valgrind
        heaptrack
        cargo-flamegraph
        kdePackages.kcachegrind
      ]
      ++ lib.optionals cfg.enableUprof [ amd-uprof ];
  };
}
