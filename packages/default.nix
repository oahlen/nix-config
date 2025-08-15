{pkgs}: let
  callPackage = pkgs.callPackage;
in {
  nixvim = callPackage ./nixvim {};
  nixvim-full = callPackage ./nixvim {full = true;};

  huey = callPackage ./huey {};
}
