{
  nixos-modules,
  pkgs,
  user,
  ...
}: {
  imports = [
    "${nixos-modules}/programs/gtklock"
    "${nixos-modules}/services/polkit"
  ];

  programs.niri.enable = true;

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
  programs.file-roller.enable = true;

  services.gvfs.enable = true;
  services.tumbler.enable = true;
}
