{ pkgs }:
pkgs.mkShell {
  NIX_SHELL = "Python";

  packages = [
    pkgs.python313
  ]
  ++ (with pkgs.python313Packages; [
    pandas
    numpy
  ]);
}
