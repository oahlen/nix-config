{
  nixpkgs,
  system,
  ...
}:
let
  pkgs = import nixpkgs { inherit system; };
in
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
