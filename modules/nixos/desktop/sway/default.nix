{
  nixos-modules,
  pkgs,
  user,
  ...
}: {
  imports = [
    "${nixos-modules}/desktop/shared"
  ];

  programs.sway = {
    enable = true;

    extraPackages = with pkgs; [
      brightnessctl
      grim
      libnotify
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

  programs.xwayland.enable = true;

  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = [pkgs.xdg-desktop-portal-gtk];
  };

  services.dbus = {
    enable = true;
    packages = with pkgs; [gcr];
  };

  services.gnome.gnome-keyring.enable = true;

  users.users.${user.name} = {
    extraGroups = ["audio" "video"];
  };

  environment.systemPackages = with pkgs; [
    gnome-multi-writer
    gnome-text-editor
    loupe
    nautilus
  ];

  programs.gnome-disks.enable = true;
  programs.file-roller.enable = true;

  services.gvfs.enable = true;
  services.tumbler.enable = true;
}
