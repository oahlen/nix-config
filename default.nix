let
  sources = import ./npins;
in
{
  hosts =
    let
      pkgs = import sources.nixpkgs { config.allowUnfree = true; };

      mkHost = modules: pkgs.nixos ([ ./modules ] ++ modules);
    in
    {
      desktop = mkHost [ ./hosts/desktop/configuration.nix ];
      nixos = mkHost [
        ./hosts/wsl/configuration.nix
        "${sources.NixOS-WSL}/modules"
      ];
      xps15 = mkHost [ ./hosts/xps15/configuration.nix ];
    };

  homes =
    let
      pkgs = import sources.nixpkgs {
        config.allowUnfree = true;
        overlays = [ (import ./packages/overlay.nix) ];
      };

      mkHome =
        module:
        pkgs.callPackage ./homes {
          extraPackages = (import module) pkgs;
        };
    in
    {
      desktop = mkHome ./homes/desktop;
      nixos = mkHome ./homes/wsl;
      xps15 = mkHome ./homes/xps15;
    };

  packages = import ./packages {
    pkgs = import sources.nixpkgs { };
  };

  shells = import ./shells {
    pkgs = import sources.nixpkgs { };
  };
}
