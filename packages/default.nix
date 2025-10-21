{ pkgs }:
let
  callPackage = pkgs.callPackage;
in
{
  dotfiles-manager = callPackage ./dotfiles-manager { };
  huey = callPackage ./huey { };
  nixvim = callPackage ./nixvim { };
  nixvim-full = callPackage ./nixvim { full = true; };
  rbw = callPackage ./rbw { };
}
