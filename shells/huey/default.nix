{
  customPackages,
  nixpkgs,
  system,
  ...
}: let
  pkgs = import nixpkgs {inherit system;};
in
  pkgs.mkShell {
    NIX_SHELL = "Huey";
    buildInputs = [customPackages.huey];
  }
