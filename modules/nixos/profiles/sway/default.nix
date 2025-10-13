{
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
  ];

  services.displayManager.gdm.enable = true;

  programs.sway = {
    enable = true;

    extraPackages = with pkgs; [
      adw-gtk3
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
}
