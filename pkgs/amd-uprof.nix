{
  pkgs,
  stdenv,
  requireFile,
  lib,
  autoPatchelfHook,
  gcc,
  glib,
  freetype,
  fontconfig,
  numactl,
  dbus,
  coreutils,
  ncurses5,
  kmod,
  libGLU,
  elfutils,
  libxkbcommon,
  libarchive,
  libglvnd,
  rocmPackages,
  libx11,
  libxi,
  libxcb,
  libice,
  libxmu,
  libsm,
  patchelf,
}:

stdenv.mkDerivation rec {
  pname = "amd-uprof";
  version = "5.2.606";

  src =
    let
      packageName = "AMDuProf_Linux_x64_${version}.tar.bz2";
    in
    requireFile {
      name = packageName;
      sha256 = "d5856a6640f6c673941dcb6e42f72b589d656ba40d2ba03ff1215611b2830f11";
      message = ''
        Download ${packageName} from https://www.amd.com/en/developer/uprof.html
        (EULA-gated), then add it to your Nix store:

          nix-store --add-fixed sha256 ${packageName}
      '';
    };

  nativeBuildInputs = [ autoPatchelfHook ];

  buildInputs = [
    gcc
    glib
    freetype
    fontconfig
    numactl
    dbus
    coreutils
    ncurses5
    kmod
    libGLU
    elfutils
    libxkbcommon
    libarchive
    libglvnd
    rocmPackages.rocprofiler
    libx11
    libxi
    libxcb
    pkgs."libxcb-wm"
    pkgs."libxcb-image"
    pkgs."libxcb-render-util"
    pkgs."libxcb-keysyms"
    libice
    libxmu
    libsm
  ];

  postUnpack = ''
    ${patchelf}/bin/patchelf \
      --replace-needed libroctracer64.so.1 libroctracer64.so \
      AMDuProf_Linux_x64_${version}/bin/ProfileAgents/x64/libAMDGpuAgent.so
  '';

  installPhase = ''
    runHook preInstall
    patchShebangs ./bin
    mkdir -p $out
    cp -r ./bin $out/
    cp -r ./lib $out/
    cp ./Legal/AMDuProfEndUserLicenseAgreement.htm $out/
    runHook postInstall
  '';

  # uProf ships private shared objects in $out/bin and $out/lib/x64/shared.
  preFixup = ''
    addAutoPatchelfSearchPath $out/bin
    addAutoPatchelfSearchPath $out/lib/x64/shared
  '';

  meta = with lib; {
    description = "AMD uProf performance profiling tools";
    homepage = "https://www.amd.com/en/developer/uprof.html";
    license = licenses.unfree;
    platforms = platforms.linux;
  };
}
