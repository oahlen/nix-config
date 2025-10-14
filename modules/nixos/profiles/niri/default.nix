{
  config,
  nixos-modules,
  pkgs,
  user,
  ...
}: {
  imports = [
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

  users.users.${user.name} = {
    extraGroups = ["audio" "video"];
  };

  services = {
    dbus = {
      enable = true;
      packages = with pkgs; [gcr_4 mako];
    };

    gvfs.enable = true;
    polkit-gnome.enable = true;
    swayidle.enable = true;
    tumbler.enable = true;
  };

  programs = {
    gnome-disks.enable = true;

    waybar = {
      enable = true;
      systemd.target = config.wayland.systemd.target;
    };
  };

  fonts.packages = import ./../shared/fonts {inherit pkgs;};
}
