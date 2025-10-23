{ pkgs }:
pkgs.mkShell {
  NIX_SHELL = "Hugo";

  packages = with pkgs; [
    hugo
    nodejs
    nodePackages.npm
  ];
}
