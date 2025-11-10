{
  config,
  lib,
  pkgs,
  ...
}:
with lib;
let
  cfg = config.modules.sway;
  shared = import ./../shared/desktop.nix { inherit config pkgs; };
in
{
  options.modules.sway.enable = mkEnableOption "Whether to enable the Sway window manager.";

  config = mkIf cfg.enable {
    wayland.systemd.target = "sway-session.target";

    programs = {
      sway = {
        enable = true;

        extraPackages = [
          pkgs.grim
          pkgs.slurp
        ]
        ++ shared.packages;
      };

      xwayland.enable = true;
    }
    // shared.programs;

    inherit (shared) boot;

    environment.sessionVariables = shared.sessionVariables;

    networking.networkmanager.enable = true;

    security.rtkit.enable = true;

    users.users.${config.user.name}.extraGroups = shared.groups;

    xdg.portal = {
      enable = true;
      wlr.enable = true;
      extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
    };

    services = {
      gnome.gnome-keyring.enable = true;

      swayidle.timeouts = [
        {
          timeout = 900;
          command = "${pkgs.sway}/bin/swaymsg 'output * power off'";
          resumeCommand = "${pkgs.sway}/bin/swaymsg 'output * power on'";
        }
      ];
    }
    // shared.services;

    fonts.packages = shared.fonts;
  };
}
