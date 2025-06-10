{
  nixpkgs,
  system,
  ...
}: let
  pkgs = import nixpkgs {inherit system;};
in
  pkgs.mkShell {
    NIX_SHELL = "Python";

    buildInputs =
      [
        pkgs.python312
      ]
      ++ (with pkgs.python312Packages; [
        pandas
        numpy
      ]);
  }
