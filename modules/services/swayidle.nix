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
    enable = mkEnableOption "TODO Add description";
    systemd.target = shared.mkSystemdTargetOption { };
  };

  config = mkIf cfg.enable {
    # timeout = 900;
    # command = "${swaymsg} 'output * power off'";
    # resumeCommand = "${swaymsg} 'output * power on'";

    # TODO Make monitor command configurable
    # Sway: timeout 900 '${pkgs.sway}/bin/swaymsg "output * power off"' resume '${pkgs.sway}/bin/swaymsg "output * power on"' \

    environment.systemPackages = with pkgs; [
      swayidle
    ];

    systemd.user.services.swayidle = shared.mkWaylandService {
      description = "Idle manager for Wayland";
      documentation = [ "man:swayidle(1)" ];
      target = cfg.systemd.target;
      execStart = ''
        ${pkgs.swayidle}/bin/swayidle -w \
        timeout 300 '${pkgs.gtklock}/bin/gtklock -d' \
        timeout 900 '${pkgs.niri}/bin/niri msg action power-off-monitors' resume '${pkgs.niri}/bin/niri msg action power-on-monitors' \
        timeout 1800 '${pkgs.systemd}/bin/systemctl suspend' \
        before-sleep '${pkgs.gtklock}/bin/gtklock -d'
      '';
      extraServiceConfig = {
        Environment = [ "PATH=${lib.makeBinPath [ pkgs.bash ]}" ];
      };
    };
  };
}
