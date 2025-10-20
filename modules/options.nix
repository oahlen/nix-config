{ lib, ... }:
with lib;
{
  options.wayland.systemd.target = mkOption {
    type = lib.types.str;
    default = "graphical-session.target";
    description = "The systemd user target for Wayland compositor session (e.g., sway-session.target).";
  };
}
