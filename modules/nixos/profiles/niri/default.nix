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

  environment.systemPackages = with pkgs; [
    brightnessctl
    gnome-multi-writer
    gnome-text-editor
    libnotify
    swaybg
    loupe
    nautilus
    papirus-icon-theme
    pavucontrol
    playerctl
    swayimg
    wl-clipboard
    wl-mirror
    xdg-utils
  ];

  services.polkit-gnome.enable = true;

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
