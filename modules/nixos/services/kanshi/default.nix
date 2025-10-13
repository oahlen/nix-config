{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.services.kanshi;
in
  with lib; {
    options.services.kanshi = {
      enable = mkEnableOption "Kanshi, a Wayland daemon that automatically configures outputs";

      systemd.target = lib.mkOption {
        type = lib.types.str;
        description = ''
          The systemd target that will automatically start the service.
        '';
        default = "graphical-session.target";
      };
    };
    config = mkIf cfg.enable {
      environment.systemPackages = with pkgs; [
        kanshi
      ];

      systemd.user.services.kanshi = {
        description = "Dynamic output configuration";
        documentation = ["man:kanshi(1)"];
        partOf = [cfg.systemd.target];
        requires = [cfg.systemd.target];
        after = [cfg.systemd.target];

        unitConfig = {
          ConditionEnvironment = "WAYLAND_DISPLAY";
        };

        serviceConfig = {
          Type = "simple";
          ExecStart = "${pkgs.kanshi}/bin/kanshi";
          Restart = "always";
        };
      };
    };
  }
