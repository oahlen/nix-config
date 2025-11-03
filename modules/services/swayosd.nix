{
  config,
  lib,
  pkgs,
  ...
}:
with lib;
let
  cfg = config.services.swayosd;
  shared = import ./shared { inherit config lib; };
in
{
  options.services.swayosd = {
    enable = mkEnableOption "Whether to enable swayosd, a GTK based on screen display for keyboard shortcuts like caps-lock and volume.";
    package = lib.mkPackageOption pkgs "swayosd" { };
    systemd.target = shared.mkWaylandSystemdTargetOption { };
  };

  config = mkIf cfg.enable {
    environment.systemPackages = [ cfg.package ];

    systemd.user.services.swayosd = shared.mkWaylandService {
      description = "Volume/backlight OSD indicator";
      documentation = [ "man:swayosd(1)" ];
      inherit (cfg.systemd) target;
      execStart = "${cfg.package}/bin/swayosd-server";
    };
  };
}
