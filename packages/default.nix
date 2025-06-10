{pkgs}: let
  callPackage = pkgs.callPackage;
in {
  nixvim = callPackage ./nixvim {};
}
