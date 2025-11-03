let
  sources = import ./npins;
in
{
  hosts =
    let
      pkgs = import sources.nixos-unstable {
        config = {
          allowUnfree = true;
        };
        overlays = [ (import ./packages/overlay.nix) ];
      };

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

  packages =
    let
      pkgs = import sources.nixos-unstable { };
    in
    import ./packages { inherit pkgs; };

  shells =
    let
      pkgs = import sources.nixos-unstable { };
    in
    import ./shells { inherit pkgs; };
}
