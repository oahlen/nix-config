{
  config,
  lib,
  pkgs,
  ...
}:
with lib;
let
  cfg = config.services.polkit;
  shared = import ./../shared/services.nix { inherit config lib; };
in
{
  options.services.polkit = {
    enable = mkEnableOption "Whether to enable polkit.";
    package = lib.mkPackageOption pkgs "polkit_gnome" { };
    systemd.target = shared.mkWaylandSystemdTargetOption { };
  };

  config = mkIf cfg.enable {
    security.polkit.enable = true;

    systemd.user.services.polkit-gnome-authentication-agent-1 = shared.mkWaylandService {
      description = "Authentication agent";
      inherit (cfg.systemd) target;
      execStart = "${cfg.package}/libexec/polkit-gnome-authentication-agent-1";
    };
  };
}
