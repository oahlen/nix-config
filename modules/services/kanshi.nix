{
  config,
  lib,
  pkgs,
  ...
}:
with lib;
let
  cfg = config.services.kanshi;
  shared = import ./shared { inherit config lib; };
in
{
  options.services.kanshi = {
    enable = mkEnableOption "Whether to enable kanshi, a Wayland daemon that automatically configures outputs.";
    package = lib.mkPackageOption pkgs "kanshi" { };
    systemd.target = shared.mkWaylandSystemdTargetOption { };
  };

  config = mkIf cfg.enable {
    environment.systemPackages = [ cfg.package ];

    systemd.user.services.kanshi = shared.mkWaylandService {
      description = "Dynamic output configuration";
      documentation = [ "man:kanshi(1)" ];
      inherit (cfg.systemd) target;
      execStart = "${lib.getExe cfg.package}";
    };
  };
}
