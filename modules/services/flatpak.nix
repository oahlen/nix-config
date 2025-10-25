{
  config,
  lib,
  pkgs,
  ...
}:
with lib;
let
  cfg = config.services.flatpak;
in
{
  options.services.flatpak = {
    repositories = mkOption {
      type = types.listOf (
        types.submodule {
          options = {
            name = mkOption {
              type = types.str;
              description = "The flatpak repository name";
            };
            location = mkOption {
              type = types.str;
              description = "The flatpak repository location";
            };
          };
        }
      );

      description = " The flatpak repositories to configure";
      default = [
        {
          name = "flathub";
          location = "https://flathub.org/repo/flathub.flatpakrepo";
        }
      ];
    };

    packages = mkOption {
      type = types.listOf (
        types.either (types.submodule {
          options = {
            repository = mkOption {
              type = types.str;
              description = "The flatpak repository";
              default = "flathub";
            };
            ref = mkOption {
              type = types.str;
              description = "The flatpak package reference";
            };
          };
        }) types.str
      );
      description = "The flatpak packages to install";
      default = [ ];
    };
  };

  config = mkIf (builtins.length cfg.packages > 0) {
    services.flatpak.enable = true;

    environment.systemPackages =
      let
        mapEntry =
          entry:
          if builtins.isString entry then
            "flathub " + entry + "\n"
          else
            entry.repository + " " + entry.ref + "\"\n";
      in
      with pkgs;
      [
        (writeShellApplication {
          name = "flatpak-sync";
          runtimeInputs = [ flatpak ];
          text = ''
            ${concatMapStrings (
              x: "flatpak remote-add --if-not-exists " + x.name + " " + x.location + "\n"
            ) cfg.repositories}
            ${concatMapStrings (x: "flatpak install --or-update ${mapEntry x}\n") cfg.packages}
          '';
        })
      ];
  };
}
