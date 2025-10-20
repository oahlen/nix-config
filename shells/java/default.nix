{
  nixpkgs,
  system,
  ...
}:
let
  pkgs = import nixpkgs { inherit system; };
in
pkgs.mkShell {
  NIX_SHELL = "Java";
  JAVA_HOME = "${pkgs.jdk.home}";

  LD_LIBRARY_PATH =
    with pkgs;
    lib.makeLibraryPath [
      stdenv.cc.cc
      openssl
    ];

  packages = with pkgs; [
    gradle
    jdk
    jdt-language-server
    maven
    minikube
  ];
}
