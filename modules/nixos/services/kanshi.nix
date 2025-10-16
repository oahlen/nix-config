{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.services.kanshi;
  shared = import ./shared {inherit config lib;};
in {
  options.services.kanshi = {
    enable = mkEnableOption "Kanshi, a Wayland daemon that automatically configures outputs";
    systemd.target = shared.mkSystemdTargetOption {};
  };

  config = mkIf cfg.enable {
    environment.systemPackages = [
      pkgs.kanshi
    ];

    systemd.user.services.kanshi = shared.mkWaylandService {
      description = "Dynamic output configuration";
      documentation = ["man:kanshi(1)"];
      execStart = "${pkgs.kanshi}/bin/kanshi";
      target = cfg.systemd.target;
    };
  };
}
