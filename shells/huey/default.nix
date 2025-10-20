{
  nixpkgs,
  packages,
  system,
  ...
}:
let
  pkgs = import nixpkgs { inherit system; };
in
pkgs.mkShell {
  NIX_SHELL = "Huey";
  packages = [ packages.huey ];
}
