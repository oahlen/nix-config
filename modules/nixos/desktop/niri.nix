{
  config,
  lib,
  pkgs,
  user,
  ...
}:
with lib; let
  cfg = config.modules.desktop.niri;
  shared = import ./shared {inherit pkgs;};
in {
  options.modules.desktop.niri.enable = mkEnableOption "Enable the Niri window manager";

  config = mkIf cfg.enable {
    wayland.systemd.target = "niri-session.target";

    services.displayManager.gdm.enable = true;

    programs.niri.enable = true;

    environment.sessionVariables = shared.sessionVariables;

    systemd.user.targets.niri-session = {
      description = "niri compositor session";
      documentation = ["man:systemd.special(7)"];
      bindsTo = ["graphical-session.target"];
      wants = ["graphical-session-pre.target"];
      after = ["graphical-session-pre.target"];
    };

    users.users.${user.name} = {
      extraGroups = ["audio" "video"];
    };

    networking.networkmanager.enable = true;
    security.rtkit.enable = true;

    services = {
      blueman.enable = config.hardware.bluetooth.enable;

      dbus = {
        enable = true;
        packages = with pkgs; [gcr_4 mako];
      };

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
    };

    environment.systemPackages = with pkgs; [
      adwaita-icon-theme
      adw-gtk3
      brightnessctl
      foot
      fuzzel
      gnome-multi-writer
      gnome-text-editor
      hyprpicker
      libnotify
      loupe
      mako
      nautilus
      papirus-icon-theme
      pavucontrol
      playerctl
      wf-recorder
      wl-clipboard
      wl-mirror
      xdg-utils
      xwayland-satellite
    ];

    fonts.packages = shared.fonts;
  };
}
