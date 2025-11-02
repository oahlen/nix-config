let
  sources = import ./npins;
  pkgs = import sources.nixos-unstable {
    config = {
      allowUnfree = true;
    };
  };
in
{
  hosts =
    let
      mkHost = modules: pkgs.nixos ([ ./modules ] ++ modules);
    in
    {
      desktop = mkHost [ ./hosts/desktop/configuration.nix ];
      wsl = mkHost [
        ./hosts/wsl/configuration.nix
        "${sources.NixOS-WSL}/modules"
      ];
      xps15 = mkHost [ ./hosts/xps15/configuration.nix ];
    };

  packages = import ./packages { inherit pkgs; };

  shells = import ./shells { inherit pkgs; };
}
