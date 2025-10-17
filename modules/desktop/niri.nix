{
  config,
  lib,
  pkgs,
  user,
  ...
}:
with lib;
let
  cfg = config.modules.desktop.niri;
  shared = import ./shared { inherit config pkgs; };
in
{
  options.modules.desktop.niri.enable = mkEnableOption "Enable the Niri window manager";

  config = mkIf cfg.enable {
    wayland.systemd.target = "niri-session.target";

    programs = {
      niri.enable = true;
    }
    // shared.programs;

    environment.sessionVariables = shared.sessionVariables;

    systemd.user.targets.niri-session = {
      description = "niri compositor session";
      documentation = [ "man:systemd.special(7)" ];
      bindsTo = [ "graphical-session.target" ];
      wants = [ "graphical-session-pre.target" ];
      after = [ "graphical-session-pre.target" ];
    };

    users.users.${user.name}.extraGroups = shared.groups;

    networking.networkmanager.enable = true;
    security.rtkit.enable = true;

    services = shared.services;

    environment.systemPackages =
      with pkgs;
      [
        xwayland-satellite
      ]
      ++ shared.packages;

    fonts.packages = shared.fonts;
  };
}
