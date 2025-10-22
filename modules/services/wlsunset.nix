{
  config,
  lib,
  pkgs,
  ...
}:
with lib;
let
  cfg = config.services.wlsunset;
  shared = import ./shared { inherit config lib; };
in
{
  options.services.wlsunset = {
    enable = mkEnableOption "Whether to enable wlsunset.";
    package = lib.mkPackageOption pkgs "wlsunset" { };
    systemd.target = shared.mkWaylandSystemdTargetOption { };

    args = mkOption {
      type = with types; listOf str;
      default = [ ];
      description = "Arguments to pass to wlsunset.";
    };
  };

  config = mkIf cfg.enable {
    environment.systemPackages = [ cfg.package ];

    systemd.user.services.wlsunset = shared.mkWaylandService {
      description = "Day/night gamma adjustments for Wayland compositors.";
      target = cfg.systemd.target;
      execStart = "${lib.getExe cfg.package} ${lib.escapeShellArgs cfg.args}";
    };
  };
}
