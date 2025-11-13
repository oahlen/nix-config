{ pkgs }:
pkgs.mkShell {
  NIX_SHELL = "Java";
  JAVA_HOME = "${pkgs.jdk.home}";

  LD_LIBRARY_PATH =
    with pkgs;
    lib.makeLibraryPath [
      openssl
    ];

  packages = with pkgs; [
    # gradle
    jdk
    jdt-language-server
    maven
  ];
}
