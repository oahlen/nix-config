let
  sources = import ../npins;
  pkgs = import sources.nixos-unstable {
    config = {
      allowUnfree = true;
    };
  };
in
modules:
pkgs.nixos (
  [
    ../modules
    "${sources.NixOS-WSL}/modules"
  ]
  ++ modules
)
