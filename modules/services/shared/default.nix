{
  config,
  lib,
}:
with lib;
{
  mkWaylandSystemdTargetOption =
    { }:
    mkOption {
      type = lib.types.str;
      description = "Systemd target to bind to.";
      default = config.wayland.systemd.target;
      defaultText = literalExpression "config.wayland.systemd.target";
      example = "sway-session.target";
    };

  mkWaylandService =
    {
      description,
      documentation ? [ ],
      target,
      execStart,
      extraServiceConfig ? { },
    }:
    {
      description = description;
      documentation = documentation;

      after = [ target ];
      partOf = [ target ];
      requires = [ target ];
      wantedBy = [ target ];
      wants = [ target ];

      unitConfig = {
        ConditionEnvironment = "WAYLAND_DISPLAY";
      };

      serviceConfig = {
        Type = "simple";
        ExecStart = execStart;
        Restart = "on-failure";
        RestartSec = 1;
        TimeoutStopSec = 10;
      }
      // extraServiceConfig;
    };
}
