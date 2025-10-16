{
  config,
  lib,
  pkgs,
  user,
  ...
}:
with lib; let
  cfg = config.modules.desktop.sway;
  shared = import ./shared {inherit pkgs;};
in {
  options.modules.desktop.sway.enable = mkEnableOption "Enable the Sway window manager";

  config = mkIf cfg.enable {
    wayland.systemd.target = "sway-session.target";

    services.displayManager.gdm.enable = true;

    programs.sway = {
      enable = true;

      extraPackages = with pkgs; [
        adwaita-icon-theme
        adw-gtk3
        brightnessctl
        foot
        fuzzel
        gnome-multi-writer
        gnome-text-editor
        grim
        hyprpicker
        libnotify
        loupe
        mako
        nautilus
        papirus-icon-theme
        pavucontrol
        playerctl
        slurp
        wf-recorder
        wl-clipboard
        wl-mirror
        xdg-utils
      ];
    };

    environment.sessionVariables = shared.sessionVariables;

    networking.networkmanager.enable = true;
    security.rtkit.enable = true;

    users.users.${user.name} = {
      extraGroups = ["audio" "video"];
    };

    xdg.portal = {
      enable = true;
      wlr.enable = true;
      extraPortals = [pkgs.xdg-desktop-portal-gtk];
    };

    services = {
      blueman.enable = config.hardware.bluetooth.enable;

      dbus = {
        enable = true;
        packages = with pkgs; [gcr_4 mako];
      };

      gnome.gnome-keyring.enable = true;
      gvfs.enable = true;
      pipewire = shared.pipewire;
      polkit.enable = true;
      swayidle.enable = true;
      swayosd.enable = true;
      swww.enable = true;
      tumbler.enable = true;
      wlsunset.enable = true;
    };

    programs = {
      dconf.enable = true;
      gnome-disks.enable = true;
      gtklock = shared.gtklock;
      nm-applet.enable = true;

      waybar = {
        enable = true;
        systemd.target = config.wayland.systemd.target;
      };

      xwayland.enable = true;
    };

    fonts.packages = shared.fonts;
  };
}
