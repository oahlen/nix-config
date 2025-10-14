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
  ];

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

  users.users.${user.name} = {
    extraGroups = ["audio" "video"];
  };

  programs.xwayland.enable = true;

  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = [pkgs.xdg-desktop-portal-gtk];
  };

  services = {
    dbus = {
      enable = true;
      packages = with pkgs; [gcr_4];
    };

    gnome.gnome-keyring.enable = true;
    gvfs.enable = true;
    polkit-gnome.enable = true;
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
