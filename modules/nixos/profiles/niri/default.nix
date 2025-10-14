{
  config,
  nixos-modules,
  pkgs,
  ...
}: {
  imports = [
    "${nixos-modules}/profiles/shared/desktop"
    "${nixos-modules}/profiles/shared/fonts"
    "${nixos-modules}/programs/gtklock"
    "${nixos-modules}/services/networkmanager"
    "${nixos-modules}/services/pipewire"
    "${nixos-modules}/services/polkit"
    "${nixos-modules}/services/swayidle"
  ];

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

  environment.systemPackages = with pkgs; [
    adw-gtk3
    brightnessctl
    hyprpicker
    libnotify
    papirus-icon-theme
    pavucontrol
    playerctl
    swayimg
    wl-clipboard
    wl-mirror
    xdg-utils
    xwayland-satellite
  ];

  services = {
    polkit-gnome.enable = true;
    swayidle.enable = true;
  };

  programs.waybar = {
    enable = true;
    systemd.target = config.wayland.systemd.target;
  };
}
