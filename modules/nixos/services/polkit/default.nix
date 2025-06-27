{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.services.polkit-gnome;
in
  with lib; {
    options.services.polkit-gnome = {
      enable = mkEnableOption "Custom polkit-gnome service";

      systemd.target = lib.mkOption {
        type = lib.types.str;
        description = ''
          The systemd target that will automatically start the polkit service.
        '';
        default = "graphical-session.target";
      };
    };

    config = mkIf cfg.enable {
      security.polkit.enable = true;

      systemd = {
        user.services.polkit-gnome-authentication-agent-1 = {
          description = "polkit-gnome-authentication-agent-1";
          wantedBy = [cfg.systemd.target];
          wants = [cfg.systemd.target];
          after = [cfg.systemd.target];
          serviceConfig = {
            Type = "simple";
            ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
            Restart = "on-failure";
            RestartSec = 1;
            TimeoutStopSec = 10;
          };
        };
      };
    };
  }
