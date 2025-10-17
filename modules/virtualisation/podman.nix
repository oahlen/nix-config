{
  config,
  lib,
  pkgs,
  ...
}:
with lib;
let
  cfg = config.modules.virtualisation.podman;
in
{
  options.modules.virtualisation.podman.enable = mkEnableOption "Whether to enable Podman.";

  config = mkIf cfg.enable {
    virtualisation.podman = {
      enable = true;

      autoPrune = {
        enable = true;
        flags = [ "--all" ];
        dates = "weekly";
      };

      dockerCompat = true;
      defaultNetwork.settings.dns_enabled = true;
    };

    environment.systemPackages = with pkgs; [
      podman-compose
    ];
  };
}
