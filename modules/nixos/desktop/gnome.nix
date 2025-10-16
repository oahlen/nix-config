{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.modules.desktop.gnome;
  shared = import ./shared {inherit pkgs;};
in {
  options.modules.desktop.gnome.enable = mkEnableOption "Enable the Gnome desktop environment";

  config = mkIf cfg.enable {
    services.displayManager.gdm.enable = true;
    services.desktopManager.gnome.enable = true;

    environment.sessionVariables = shared.sessionVariables;

    services = {
      gnome = {
        evolution-data-server.enable = mkForce false;
        gnome-online-accounts.enable = false;
      };

      pipewire = shared.pipewire;
    };

    programs = {
      evolution.enable = false;
    };

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

    fonts.packages = shared.fonts;
  };
}
