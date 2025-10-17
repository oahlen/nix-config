{
  description = "My Nix Config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixos-wsl = {
      url = "github:nix-community/NixOS-WSL";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      nixos-wsl,
      ...
    }@inputs:
    let
      lib = import ./lib.nix { defaultSystems = [ "x86_64-linux" ]; };
      users = import ./users.nix;

      makeNixosConfiguration =
        hostname: username:
        nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit inputs;
            customPackages = self.outputs.packages;
            user = users.${username};
          };

          modules = [
            ./hosts/${hostname}
            self.nixosModules.default
            nixos-wsl.nixosModules.wsl
          ];
        };

      makeHomeConfiguration =
        system: hostname: username:
        home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.${system};

          extraSpecialArgs = {
            inherit
              inputs
              system
              ;
            user = users.${username};
            customPackages = self.outputs.packages.${system};
          };

          modules = [
            ./hosts/${hostname}/home/${username}
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

      homeConfigurations = {
        "oahlen@desktop" = makeHomeConfiguration "x86_64-linux" "desktop" "oahlen";
      };

      packages = lib.forEachDefaultSystem (
        system:
        let
          pkgs = import nixpkgs { inherit system; };
        in
        import ./packages { inherit pkgs; }
      );

      devShells = lib.forEachDefaultSystem (system: {
        dotnet = import ./shells/dotnet { inherit nixpkgs system; };
        fhs = import ./shells/fhs { inherit nixpkgs system; };
        huey = import ./shells/huey {
          customPackages = self.outputs.packages.${system};
          inherit nixpkgs system;
        };
        hugo = import ./shells/hugo { inherit nixpkgs system; };
        java = import ./shells/java { inherit nixpkgs system; };
        python = import ./shells/python { inherit nixpkgs system; };
        rust = import ./shells/rust { inherit nixpkgs system; };
      });

      formatter = lib.forEachDefaultSystem (system: nixpkgs.legacyPackages.${system}.nixfmt-tree);
    };
}
