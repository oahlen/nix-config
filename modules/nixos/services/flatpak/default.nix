{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.services.flatpak.packages;
in
  with lib; {
    options.services.flatpak.packages = lib.mkOption {
      type = with lib.types; listOf str;
      description = ''
        The flathub packages to install
      '';
      default = [];
    };

    config = mkIf (builtins.length cfg > 0) {
      services.flatpak.enable = true;

      environment.systemPackages = with pkgs; [
        (writeShellApplication {
          name = "sync-flatpaks";
          runtimeInputs = [flatpak];
          text = ''
            flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
            ${
              lib.concatMapStrings (x: "flatpak install --or-update flathub " + x + "\n") cfg
            }
          '';
        })
      ];
    };
  }
