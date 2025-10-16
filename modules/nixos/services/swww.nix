{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.services.swww;
  shared = import ./shared {inherit config lib;};
in {
  options.services.swww = {
    enable = mkEnableOption "TODO add description";
    systemd.target = shared.mkSystemdTargetOption {};
  };

  config = mkIf cfg.enable {
    environment.systemPackages = [
      pkgs.swww
    ];

    systemd.user.services.swww = shared.mkWaylandService {
      description = "Wallpaper service for Wayland";
      documentation = ["man:swww(1)"];
      execStart = "${pkgs.swww}/bin/swww-daemon";
      target = cfg.systemd.target;
    };
  };
}
