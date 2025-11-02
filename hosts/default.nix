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
  ]
  ++ modules
)
