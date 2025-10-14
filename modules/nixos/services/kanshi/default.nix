{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.services.kanshi;
in {
  options.services.kanshi = {
    enable = mkEnableOption "Kanshi, a Wayland daemon that automatically configures outputs";

    systemd.target = lib.mkOption {
      type = lib.types.str;
      description = ''
        The systemd target that will automatically start the service.
      '';
      default = config.wayland.systemd.target;
    };
  };

  config = mkIf cfg.enable {
    environment.systemPackages = [
      pkgs.kanshi
    ];

    systemd.user.services.kanshi = {
      description = "Dynamic output configuration";
      documentation = ["man:kanshi(1)"];

      after = [cfg.systemd.target];
      partOf = [cfg.systemd.target];
      requires = [cfg.systemd.target];
      wantedBy = [cfg.systemd.target];
      wants = [cfg.systemd.target];

      unitConfig = {
        ConditionEnvironment = "WAYLAND_DISPLAY";
      };

      serviceConfig = {
        Type = "simple";
        ExecStart = "${pkgs.kanshi}/bin/kanshi";
        Restart = "on-failure";
      };
    };
  };
}
