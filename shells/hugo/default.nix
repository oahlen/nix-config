{
  nixpkgs,
  system,
  ...
}:
let
  pkgs = import nixpkgs { inherit system; };
in
pkgs.mkShell {
  NIX_SHELL = "Hugo";

  buildInputs = with pkgs; [
    hugo
    nodejs
    nodePackages.npm
  ];
}
