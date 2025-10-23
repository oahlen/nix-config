{
  description = "My Nix Config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    nixos-wsl = {
      url = "github:nix-community/NixOS-WSL";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      nixos-wsl,
      ...
    }@inputs:
    let
      config = import ./config.nix { defaultSystems = [ "x86_64-linux" ]; };

      makeNixosConfiguration =
        hostname: username:
        nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit inputs;
            user = config.users.${username};
          };

          modules = [
            ./hosts/${hostname}
            self.nixosModules.default
            nixos-wsl.nixosModules.wsl
          ];
        };
    in
    {
      nixosModules.default = import ./modules;

      nixosConfigurations = {
        desktop = makeNixosConfiguration "desktop" "oahlen";
        nixos = makeNixosConfiguration "wsl" "oahlen";
        xps15 = makeNixosConfiguration "xps15" "oahlen";
      };

      packages = config.forEachDefaultSystem (
        system:
        let
          pkgs = import nixpkgs { inherit system; };
        in
        import ./packages { inherit pkgs; }
      );

      devShells = config.forEachDefaultSystem (
        system:
        let
          pkgs = import nixpkgs { inherit system; };
        in
        import ./shells { inherit pkgs; }
      );

      formatter = config.forEachDefaultSystem (system: nixpkgs.legacyPackages.${system}.nixfmt-tree);
    };
}
