{ pkgs }:
let
  combined = with pkgs.dotnetCorePackages; combinePackages [ sdk_8_0 ];
in
pkgs.mkShell {
  NIX_SHELL = "DotNet";
  ASPNETCORE_ENVIRONMENT = "Development";
  DOTNET_ROOT = "${combined}/share/dotnet/";

  # For GUI based applications
  LD_LIBRARY_PATH =
    with pkgs;
    lib.makeLibraryPath [
      fontconfig
      libGL
      libxkbcommon
      mono # For certain tools like Microsoft sbom tool
      openssl # Needed by GitVersion
      wayland
      xorg.libICE
      xorg.libSM
      xorg.libX11
      xorg.libXcursor
      xorg.libXi
      xorg.libXrandr
    ];

  packages = with pkgs; [
    combined
    # netcoredbg # Currently broken
    nodejs
    nodePackages.npm
    omnisharp-roslyn
    openssl
    (writeShellApplication {
      name = "update-packages";
      runtimeInputs = [ combined ];
      text = builtins.readFile ./update-packages;
    })
    (writeShellApplication {
      name = "quick-format";
      runtimeInputs = [
        combined
        git
        gnugrep
      ];
      text = builtins.readFile ./quick-format;
    })
  ];
}
