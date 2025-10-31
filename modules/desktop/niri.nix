{
  config,
  lib,
  pkgs,
  ...
}:
with lib;
let
  cfg = config.modules.desktop.niri;
  shared = import ./shared { inherit config pkgs; };
in
{
  options.modules.desktop.niri.enable = mkEnableOption "Whether to enable the Niri window manager.";

  config = mkIf cfg.enable {
    wayland.systemd.target = "niri-session.target";

    programs = {
      niri.enable = true;
    }
    // shared.programs;

    boot = shared.boot;

    environment.sessionVariables = shared.sessionVariables;

    systemd.user.targets.niri-session = {
      description = "niri compositor session";
      documentation = [ "man:systemd.special(7)" ];
      bindsTo = [ "graphical-session.target" ];
      wants = [ "graphical-session-pre.target" ];
      after = [ "graphical-session-pre.target" ];
    };

    users.users.${config.user.name}.extraGroups = shared.groups;

    networking.networkmanager.enable = true;
    security.rtkit.enable = true;

    services = {
      swayidle.timeouts = [
        {
          timeout = 900;
          command = "${lib.getExe niri} msg action power-off-monitors";
          resumeCommand = "${lib.getExe niri} msg action power-on-monitors";
        }
      ];
    }
    // shared.services;

    environment.systemPackages =
      with pkgs;
      [
        xwayland-satellite
      ]
      ++ shared.packages;

    fonts.packages = shared.fonts;
  };
}
