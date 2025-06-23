{
  pkgs,
  user,
  ...
}: {
  programs.hyprland = {
    enable = true;
    withUWSM = true;
  };

  # tty
  # if uwsm check may-start && uwsm select; then
  #     exec uwsm start default
  # fi

  # if uwsm check may-start; then
  #     exec uwsm start hyprland.desktop
  #fi

  programs.hyprlock.enable = true;

  services.hypridle.enable = true;

  xdg.portal.enable = true;

  services.gnome.gnome-keyring.enable = true;

  services.dbus = {
    enable = true;
    packages = with pkgs; [gcr];
  };

  users.users.${user.name} = {
    extraGroups = ["audio" "video"];
  };

  environment.systemPackages = with pkgs; [
    brightnessctl
    gnome-multi-writer
    gnome-text-editor
    libnotify
    hyprnotify
    loupe
    nautilus
    papirus-icon-theme
    pavucontrol
    playerctl
  ];

  programs.gnome-disks.enable = true;
  programs.file-roller.enable = true;

  services.gvfs.enable = true;
  services.tumbler.enable = true;
}
