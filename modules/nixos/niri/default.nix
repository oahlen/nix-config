{
  config,
  lib,
  pkgs,
  user,
  ...
}:
with lib; let
  cfg = config.modules.niri;
in {
  options.modules.niri.enable = mkEnableOption "Enable the Niri window manager";

  config = mkIf cfg.enable {
    modules = {
      networkmanager.enable = true;
      pipewire.enable = true;
      polkit.enable = true;
      screenlocker.enable = true;
    };

    wayland.systemd.target = "niri-session.target";

    services.displayManager.gdm.enable = true;

    programs.niri.enable = true;

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

    services = {
      blueman.enable = config.hardware.bluetooth.enable;

      dbus = {
        enable = true;
        packages = with pkgs; [gcr_4 mako];
      };

      gvfs.enable = true;
      tumbler.enable = true;
    };

    programs = {
      gnome-disks.enable = true;

      waybar = {
        enable = true;
        systemd.target = config.wayland.systemd.target;
      };
    };

    environment.systemPackages = with pkgs; [
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
      swayimg
      wl-clipboard
      wl-mirror
      xdg-utils
      xwayland-satellite
    ];
  };
}
