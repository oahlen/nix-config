let
  sources = import ./npins;
in
{
  hosts =
    let
      pkgs = import sources.nixpkgs {
        config.allowUnfree = true;
        overlays = [ (import ./packages/overlay.nix) ];
      };

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

  environments =
    let
      pkgs = import sources.nixpkgs {
        config.allowUnfree = true;
        overlays = [ (import ./packages/overlay.nix) ];
      };

      mkEnvironment =
        module:
        pkgs.callPackage ./packages/environment.nix {
          packagesToInstall = (import module) pkgs;
        };
    in
    {
      generic = mkEnvironment ./hosts/packages.nix;
    };

  packages = import ./packages {
    pkgs = import sources.nixpkgs { };
  };

  shells = import ./shells {
    pkgs = import sources.nixpkgs { };
  };
}
