{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.modules.gnome;
in {
  options.modules.gnome.enable = mkEnableOption "Enable the Gnome desktop environment";

  config = mkIf cfg.enable {
    modules = {
      networkmanager.enable = true;
      pipewire.enable = true;
    };

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
      evince
      file-roller
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
      seahorse
      simple-scan
      totem
      yelp
    ];
  };
}
