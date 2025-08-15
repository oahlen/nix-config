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

    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    nixos-wsl,
    nix-index-database,
    ...
  } @ inputs: let
    lib = import ./lib.nix {defaultSystems = ["x86_64-linux"];};
    users = import ./users.nix;

    makeNixosConfiguration = let
      nixos-modules = "${self}/modules/nixos";
    in
      hostname: username:
        nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit inputs nixos-modules;
            user = users.${username};
          };

          modules = [
            ./hosts/${hostname}
            "${nixos-modules}"
            nixos-wsl.nixosModules.wsl
          ];
        };

    makeHomeConfiguration = let
      hm-modules = "${self}/modules/home-manager";
    in
      system: hostname: username:
        home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.${system};

          extraSpecialArgs = {
            inherit inputs hm-modules system;
            user = users.${username};
            customPackages = self.outputs.packages.${system};
          };

          modules = [
            ./home/${username}/${hostname}
            "${hm-modules}"
            nix-index-database.homeModules.nix-index
          ];
        };
  in {
    nixosConfigurations = {
      desktop = makeNixosConfiguration "desktop" "oahlen";
      nixos = makeNixosConfiguration "wsl" "oahlen";
      xps15 = makeNixosConfiguration "xps15" "oahlen";
    };

    homeConfigurations = {
      "oahlen@debian" = makeHomeConfiguration "x86_64-linux" "generic" "oahlen";
      "oahlen@desktop" = makeHomeConfiguration "x86_64-linux" "desktop" "oahlen";
      "oahlen@nixos" = makeHomeConfiguration "x86_64-linux" "wsl" "oahlen";
      "oahlen@xps15" = makeHomeConfiguration "x86_64-linux" "xps15" "oahlen";
    };

    packages = lib.forEachDefaultSystem (
      system: let
        pkgs = import nixpkgs {inherit system;};
      in
        import ./packages {inherit pkgs;}
    );

    devShells = lib.forEachDefaultSystem (
      system: {
        default = import ./shells {
          customPackages = self.outputs.packages.${system};
          inherit nixpkgs system;
        };
        dotnet = import ./shells/dotnet {inherit nixpkgs system;};
        fhs = import ./shells/fhs {inherit nixpkgs system;};
        huey = import ./shells/huey {
          customPackages = self.outputs.packages.${system};
          inherit nixpkgs system;
        };
        hugo = import ./shells/hugo {inherit nixpkgs system;};
        java = import ./shells/java {inherit nixpkgs system;};
        python = import ./shells/python {inherit nixpkgs system;};
        rust = import ./shells/rust {inherit nixpkgs system;};
      }
    );
  };
}
