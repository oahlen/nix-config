{ pkgs }:
let
  inherit (pkgs) callPackage;
in
{
  homage = callPackage ./homage { };
  huevim = callPackage ./huevim { };
  nixvim = callPackage ./nixvim { };
  nixvim-full = callPackage ./nixvim { full = true; };
  rbw-wrapped = callPackage ./rbw-wrapped { };
  rebuild = callPackage ./rebuild { };
}
