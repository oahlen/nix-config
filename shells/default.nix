{ pkgs }:
{
  dotnet = import ./dotnet { inherit pkgs; };
  fhs = import ./fhs { inherit pkgs; };
  hugo = import ./hugo { inherit pkgs; };
  java = import ./java { inherit pkgs; };
  python = import ./python { inherit pkgs; };
  rust = import ./rust { inherit pkgs; };
}
