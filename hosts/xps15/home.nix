{ callPackage, pkgs }:
callPackage ../home.nix {
  extraPackages = with pkgs; [
    _1password-gui
    fastfetch
    nodejs
    powertop
    rbw-wrapped
  ];
}
