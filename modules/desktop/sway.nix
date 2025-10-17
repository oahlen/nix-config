{
  config,
  lib,
  pkgs,
  user,
  ...
}:
with lib;
let
  cfg = config.modules.desktop.sway;
  shared = import ./shared { inherit config pkgs; };
in
{
  options.modules.desktop.sway.enable = mkEnableOption "Whether to enable the Sway window manager.";

  config = mkIf cfg.enable {
    wayland.systemd.target = "sway-session.target";

    programs = {
      sway = {
        enable = true;

        extraPackages =
          with pkgs;
          [
            grim
            slurp
          ]
          ++ shared.packages;
      };

      xwayland.enable = true;
    }
    // shared.programs;

    environment.sessionVariables = shared.sessionVariables;

    networking.networkmanager.enable = true;
    security.rtkit.enable = true;

    users.users.${user.name}.extraGroups = shared.groups;

    xdg.portal = {
      enable = true;
      wlr.enable = true;
      extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
    };

    services = {
      gnome.gnome-keyring.enable = true;

      swayidle.command = ''
        ${pkgs.swayidle}/bin/swayidle -w \
        timeout 300 '${pkgs.gtklock}/bin/gtklock -d' \
        timeout 900 '${pkgs.sway}/bin/swaymsg "output * power off"' resume '${pkgs.sway}/bin/swaymsg "output * power on"' \
        timeout 1800 '${pkgs.systemd}/bin/systemctl suspend' \
        before-sleep '${pkgs.gtklock}/bin/gtklock -d'
      '';
    }
    // shared.services;

    fonts.packages = shared.fonts;
  };
}
