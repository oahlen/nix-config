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
    enable = mkEnableOption "TODO Add description";
    systemd.target = shared.mkSystemdTargetOption { };
  };

  config = mkIf cfg.enable {
    environment.systemPackages = [
      pkgs.wlsunset
    ];

    systemd.user.services.wlsunset = shared.mkWaylandService {
      description = "Day/night gamma adjustments for Wayland compositors.";
      # documentation = [""]; TODO Add doc
      execStart = "${pkgs.wlsunset}/bin/wlsunset -L 17.64 -l 59.85 -T 6500 -t 4500";
      target = cfg.systemd.target;
    };
  };
}
