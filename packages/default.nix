{ pkgs }:
let
  callPackage = pkgs.callPackage;
in
{
  homage = callPackage ./homage { };
  huey = callPackage ./huey { };
  nixvim = callPackage ./nixvim { };
  nixvim-full = callPackage ./nixvim { full = true; };
  rbw-wrapped = callPackage ./rbw { };
}
