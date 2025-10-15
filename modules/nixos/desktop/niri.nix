{
  config,
  lib,
  pkgs,
  user,
  ...
}:
with lib; let
  cfg = config.modules.desktop.niri;
in {
  options.modules.desktop.niri.enable = mkEnableOption "Enable the Niri window manager";

  config = mkIf cfg.enable {
    modules = {
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

    networking.networkmanager.enable = true;
    security.rtkit.enable = true;

    services = {
      blueman.enable = config.hardware.bluetooth.enable;

      dbus = {
        enable = true;
        packages = with pkgs; [gcr_4 mako];
      };

      gvfs.enable = true;

      pipewire = {
        enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;
        pulse.enable = true;
      };

      polkit.enable = true;
      tumbler.enable = true;
    };

    programs = {
      gnome-disks.enable = true;
      nm-applet.enable = true;

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

    fonts.packages = with pkgs; [
      dejavu_fonts
      liberation_ttf
      nerd-fonts.jetbrains-mono
      noto-fonts-emoji
    ];
  };
}
