{ pkgs }:
let
  callPackage = pkgs.callPackage;
in
{
  huey = callPackage ./huey { };
  nixvim = callPackage ./nixvim { };
  nixvim-full = callPackage ./nixvim { full = true; };
  rbw = callPackage ./rbw { };
}
