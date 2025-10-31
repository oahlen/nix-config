{ lib, ... }:
with lib;
{
  options = {
    user = {
      name = mkOption {
        type = lib.types.str;
        default = "oahlen";
        description = "The name of the user name";
      };

      fullName = mkOption {
        type = lib.types.str;
        default = "Oscar Ahlén";
        description = "The full name of the user.";
      };
    };

    wayland.systemd.target = mkOption {
      type = lib.types.str;
      default = "graphical-session.target";
      description = "The systemd user target for Wayland compositor session (e.g., sway-session.target).";
    };
  };
}
