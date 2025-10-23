{ pkgs }:
let
  callPackage = pkgs.callPackage;
in
{
  homeage = callPackage ./homeage { };
  huey = callPackage ./huey { };
  nixvim = callPackage ./nixvim { };
  nixvim-full = callPackage ./nixvim { full = true; };
  rbw-wrapped = callPackage ./rbw { };
}
