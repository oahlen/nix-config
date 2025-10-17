{
  config,
  lib,
  pkgs,
  ...
}:
with lib;
let
  cfg = config.services.swayidle;
  shared = import ./shared { inherit config lib; };
in
{
  options.services.swayidle = {
    enable = mkEnableOption "Whether to enable idle manager for Wayland.";
    systemd.target = shared.mkWaylandSystemdTargetOption { };

    command = lib.mkOption {
      type = lib.types.str;
      default = "${pkgs.swayidle}/bin/swayidle -w";
    };
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      swayidle
    ];

    systemd.user.services.swayidle = shared.mkWaylandService {
      description = "Idle manager for Wayland";
      documentation = [ "man:swayidle(1)" ];
      target = cfg.systemd.target;
      execStart = cfg.command;
      extraServiceConfig = {
        Environment = [ "PATH=${lib.makeBinPath [ pkgs.bash ]}" ];
      };
    };
  };
}
