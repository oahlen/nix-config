{
  config,
  lib,
  user,
  ...
}:
with lib; let
  cfg = config.modules.networkmanager;
in {
  options.modules.networkmanager.enable = mkEnableOption "Enable networkmanager";

  config = mkIf cfg.enable {
    networking = {
      useDHCP = false;

      wireless.iwd.enable = true;

      networkmanager = {
        enable = true;
        wifi.backend = "iwd";
      };
    };

    programs.nm-applet.enable = true;

    users.users.${user.name} = {
      extraGroups = ["networkmanager"];
    };
  };
}
