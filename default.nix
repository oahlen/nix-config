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

  homes =
    let
      pkgs = import sources.nixpkgs {
        config.allowUnfree = true;
        overlays = [ (import ./packages/overlay.nix) ];
      };

      mkHome = module: pkgs.callPackage module { };
    in
    {
      desktop = mkHome ./hosts/desktop/home.nix;
      nixos = mkHome ./hosts/wsl/home.nix;
      xps15 = mkHome ./hosts/xps15/home.nix;
    };

  packages = import ./packages {
    pkgs = import sources.nixpkgs { };
  };

  shells = import ./shells {
    pkgs = import sources.nixpkgs { };
  };
}
