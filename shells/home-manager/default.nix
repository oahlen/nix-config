{ pkgs }:
pkgs.mkShell {
  NIX_SHELL = "Home Manager";

  packages = with pkgs; [
    git
    home-manager
  ];
}
