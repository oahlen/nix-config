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
    enable = mkEnableOption "TODO Add description";
    systemd.target = shared.mkSystemdTargetOption { };
  };

  config = mkIf cfg.enable {
    environment.systemPackages = [
      pkgs.swayosd
    ];

    systemd.user.services.swayosd = shared.mkWaylandService {
      description = "Volume/backlight OSD indicator";
      # documentation = [""]; TODO Add doc
      target = cfg.systemd.target;
      execStart = "${pkgs.swayosd}/bin/swayosd-server";
    };
  };
}
