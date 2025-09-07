{
  nixos-modules,
  pkgs,
  user,
  ...
}: {
  imports = [
    "${nixos-modules}/common/fonts"
    "${nixos-modules}/services/networkmanager"
    "${nixos-modules}/services/pipewire"
    "${nixos-modules}/services/polkit"
  ];

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
    brightnessctl
    gnome-multi-writer
    gnome-text-editor
    libnotify
    loupe
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

  services.polkit-gnome = {
    enable = true;
    systemd.target = "niri-session.target";
  };

  services.dbus = {
    enable = true;
    packages = with pkgs; [gcr];
  };

  users.users.${user.name} = {
    extraGroups = ["audio" "video"];
  };

  programs.gnome-disks.enable = true;

  services.gvfs.enable = true;
  services.tumbler.enable = true;
}
