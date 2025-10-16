{
  config,
  lib,
  pkgs,
  ...
}:
with lib;
let
  cfg = config.services.polkit;
  shared = import ./shared { inherit config lib; };
in
{
  options.services.polkit = {
    enable = mkEnableOption "Enable polkit";
    systemd.target = shared.mkSystemdTargetOption { };
  };

  config = mkIf cfg.enable {
    security.polkit.enable = true;

    systemd.user.services.polkit-gnome-authentication-agent-1 = shared.mkWaylandService {
      description = "Authentication agent";
      target = cfg.systemd.target;
      execStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
    };
  };
}
