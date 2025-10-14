{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.services.swayidle;
in
  with lib; {
    options.services.swayidle = {
      enable = mkEnableOption "Idle manager for Wayland";

      systemd.target = lib.mkOption {
        type = lib.types.str;
        description = ''
          The systemd target that will automatically start the service.
        '';
        default = config.wayland.systemd.target;
      };
    };

    config = mkIf cfg.enable {
      systemd.user.services.swayidle = {
        description = "Idle manager for Wayland";
        documentation = ["man:swayidle(1)"];

        after = [cfg.systemd.target];
        partOf = [cfg.systemd.target];
        requires = [cfg.systemd.target];
        wantedBy = [cfg.systemd.target];
        wants = [cfg.systemd.target];

        unitConfig = {
          ConditionEnvironment = "WAYLAND_DISPLAY";
        };

        serviceConfig = {
          Environment = ["PATH=${lib.makeBinPath [pkgs.bash]}"];
          Type = "simple";
          ExecStart = ''
            ${pkgs.swayidle}/bin/swayidle -w \
            timeout 300 '${pkgs.gtklock}/bin/gtklock -d' \
            timeout 900 '${pkgs.niri}/bin/niri msg action power-off-monitors' resume '${pkgs.niri}/bin/niri msg action power-on-monitors' \
            timeout 1800 '${pkgs.systemd}/bin/systemctl suspend' \
            before-sleep '${pkgs.gtklock}/bin/gtklock -d'
          '';
          Restart = "on-failure";
        };
      };
    };
  }
