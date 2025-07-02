{
  nixos-modules,
  lib,
  pkgs,
  ...
}:
with lib; {
  imports = [
    "${nixos-modules}/common/fonts"
    "${nixos-modules}/services/networkmanager"
    "${nixos-modules}/services/pipewire"
  ];

  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;

  environment.systemPackages = with pkgs;
    [
      dconf-editor
      gnome-tweaks
      papirus-icon-theme
    ]
    ++ (with pkgs.gnomeExtensions; [
      color-picker
      gnome-40-ui-improvements
      places-status-indicator
    ]);

  programs.evolution.enable = false;

  services.gnome = {
    evolution-data-server.enable = mkForce false;
    gnome-online-accounts.enable = false;
  };

  environment.gnome.excludePackages = with pkgs; [
    baobab
    cheese
    epiphany
    geary
    gedit
    gnome-backgrounds
    gnome-calendar
    gnome-clocks
    gnome-connections
    gnome-contacts
    gnome-logs
    gnome-maps
    gnome-music
    gnome-software
    gnome-tour
    gnome-user-docs
    gnome-weather
    orca
    simple-scan
    totem
    yelp
  ];
}
