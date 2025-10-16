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
      swayimg
      swayosd
      swww
      wl-clipboard
      wl-mirror
      wlsunset
      xdg-utils
      xwayland-satellite
    ];

    systemd.user.services.swww = {
      description = "Wallpaper service for Wayland";
      documentation = ["man:swww(1)"];

      after = [config.wayland.systemd.target];
      partOf = [config.wayland.systemd.target];
      requires = [config.wayland.systemd.target];
      wantedBy = [config.wayland.systemd.target];
      wants = [config.wayland.systemd.target];

      unitConfig = {
        ConditionEnvironment = "WAYLAND_DISPLAY";
      };

      serviceConfig = {
        Type = "simple";
        ExecStart = "${pkgs.swww}/bin/swww-daemon";
        Restart = "on-failure";
        RestartSec = 1;
        TimeoutStopSec = 10;
      };
    };

    systemd.user.services.swayosd = {
      description = "Volume/backlight OSD indicator";

      after = [config.wayland.systemd.target];
      partOf = [config.wayland.systemd.target];
      requires = [config.wayland.systemd.target];
      wantedBy = [config.wayland.systemd.target];
      wants = [config.wayland.systemd.target];

      unitConfig = {
        ConditionEnvironment = "WAYLAND_DISPLAY";
      };

      serviceConfig = {
        Type = "simple";
        ExecStart = "${pkgs.swayosd}/bin/swayosd-server";
        Restart = "on-failure";
        RestartSec = 2;
      };
    };

    systemd.user.services.wlsunset = {
      description = "Day/night gamma adjustments for Wayland compositors.";

      after = [config.wayland.systemd.target];
      partOf = [config.wayland.systemd.target];
      requires = [config.wayland.systemd.target];
      wantedBy = [config.wayland.systemd.target];
      wants = [config.wayland.systemd.target];

      unitConfig = {
        ConditionEnvironment = "WAYLAND_DISPLAY";
      };

      serviceConfig = {
        Type = "simple";
        ExecStart = "${pkgs.wlsunset}/bin/wlsunset -L 17.64 -l 59.85 -T 6500 -t 4500";
        Restart = "on-failure";
      };
    };

    fonts.packages = with pkgs; [
      dejavu_fonts
      liberation_ttf
      nerd-fonts.jetbrains-mono
      noto-fonts-emoji
    ];
  };
}
