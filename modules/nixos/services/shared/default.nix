{
  config,
  lib,
}:
{
  mkSystemdTargetOption =
    { }:
    lib.mkOption {
      type = lib.types.str;
      description = ''
        The systemd target that will automatically start the service.
      '';
      default = config.wayland.systemd.target;
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
