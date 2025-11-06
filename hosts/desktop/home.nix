{ callPackage, pkgs }:
callPackage ../home.nix {
  extraPackages = with pkgs; [
    fastfetch
    rbw-wrapped
  ];
}
