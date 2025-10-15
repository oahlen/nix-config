{
  config,
  lib,
  pkgs,
  user,
  ...
}:
with lib; let
  cfg = config.modules.desktop.sway;
in {
  options.modules.desktop.sway.enable = mkEnableOption "Enable the Sway window manager";

  config = mkIf cfg.enable {
    modules = {
      screenlocker.enable = true;
    };

    wayland.systemd.target = "sway-session.target";

    services.displayManager.gdm.enable = true;

    programs.sway = {
      enable = true;

      extraPackages = with pkgs; [
        adw-gtk3
        brightnessctl
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
        swayimg
        wf-recorder
        wl-clipboard
        wl-mirror
        xdg-utils
      ];
    };

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

      xwayland.enable = true;
    };

    fonts.packages = with pkgs; [
      dejavu_fonts
      liberation_ttf
      nerd-fonts.jetbrains-mono
      noto-fonts-emoji
    ];
  };
}
