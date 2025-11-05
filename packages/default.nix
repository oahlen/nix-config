{ pkgs }:
let
  inherit (pkgs) callPackage;
in
{
  homage = callPackage ./homage { };
  huevim = callPackage ./huevim { };
  nixvim = callPackage ./nixvim { };
  nixvim-full = callPackage ./nixvim { full = true; };
  rbw = callPackage ./rbw { };
  rebuild = callPackage ./rebuild { };
  ripgrep = callPackage ./ripgrep { };
  stylua = callPackage ./stylua { };
}
