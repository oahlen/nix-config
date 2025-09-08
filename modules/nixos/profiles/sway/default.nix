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

  programs.sway = {
    enable = true;

    extraPackages = with pkgs; [
      brightnessctl
      grim
      hyprpicker
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

  services.polkit-gnome = {
    enable = true;
    systemd.target = "sway-session.target";
  };

  services.gnome.gnome-keyring.enable = true;

  services.dbus = {
    enable = true;
    packages = with pkgs; [gcr];
  };

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

  services.gvfs.enable = true;
  services.tumbler.enable = true;
}
